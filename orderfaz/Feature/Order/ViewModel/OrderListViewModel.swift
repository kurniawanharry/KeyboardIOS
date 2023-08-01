//
//  OrderListViewModel.swift
//  orderfaz
//
//  Created by User on 28/07/23.
//

import Foundation
import Combine

@MainActor
class OrderListViewModel:ObservableObject {
    
    @Published var orders:[OrderViewModel] = []
    @Published var loading:Bool = false
    @Published var hasMore:Bool = true
    @Published var search:String = ""
    
    var subscriptions = Set<AnyCancellable>()
    
    var offset = 0
    var limit = 10
    
    init() {
        refresh()
        
        $search
            .dropFirst()
            .debounce(for: 1, scheduler: RunLoop.main)
            .sink { [weak self] term in
                if term.uppercased().starts(with: "INV-") {
                    Task {
                        DispatchQueue.main.async {
                            self?.loading = true
                        }
                        self?.orders.removeAll()
                        await self?.fetch(for: term)
                        
                        DispatchQueue.main.async {
                            self?.loading = false
                        }
                    }
                }
                
                if term.isEmpty {
                    self?.refresh()
                }
                
            }.store(in: &subscriptions)
    }
    
    func refresh() {
        Task {
            DispatchQueue.main.async {
                self.loading = true
            }
            
            await fetch(for : search)
            
            DispatchQueue.main.async {
                self.loading = false
            }
        }
    }
    
    func fetch(for search:String) async {
        do {
            try await OrderService().fetch(
                search: search,
                offset: offset,
                limit: limit
            ) { [weak self] result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async{
                        let currentPage = data.pagination?.currentPage
                        let lastPage = data.pagination?.lastPage
                        let orders = data.orders ?? []
                        
                        self?.orders = orders.map(OrderViewModel.init)
                        
                        if(currentPage == lastPage){
                            self?.hasMore = false
                        }
                    }
                case.failure(_):
                    DispatchQueue.main.async{
                        self?.hasMore = false
                    }
                    
                    print("GAGAL")
                }
            }
        } catch {
            print(error)
        }
    }
    
    func loadMore() {
        if hasMore {
            Task {
                self.offset += 10
                await fetch(for: search)
            }
        }
    }
    
    func getText(orderId:String, categoryId:Int,  completion: @escaping (Result<String, Error>) -> Void)  {
        Task {
            do {
                try await OrderService().getTextReminder(orderId: orderId, categoryId: categoryId) {result in
                    switch result {
                    case .success(let data):
                        completion(.success(data))
                    case.failure(_):
                        print("GAGAL MENGAMBIL DATA")
                    }
                }
            } catch {
                print(error)
            }
        }
    }
}

struct OrderViewModel {
    let order:Orders
    
    var id:String {
        order.id ?? ""
    }
    
    var orderId:String {
        order.orderId ?? ""
    }
    
    var createdAt:String {
        order.createdAt ?? ""
    }
    
    var orderStatusId:Int {
        order.orderStatusId ?? 0
    }
    
    var userName:String {
        order.orderDetails?.customerName ??
        order.orderDetails?.productBundleSnapshot?.first?.shipmentSnapshot?.addressSnapshot?.first?.contactName ??
        order.orderDetails?.storeName ?? ""
    }
    
    var transactionValue:Int {
        order.transactionValue ?? 0
    }
    
    var products:[Products] {
        order.orderDetails?.productBundleSnapshot?.first?.productSnapshot ?? []
    }
    
    var shipment:ShipmentSnapshot {
        order.orderDetails?.productBundleSnapshot?.first?.shipmentSnapshot ?? ShipmentSnapshot()
    }
}
