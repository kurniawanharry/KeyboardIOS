//
//  ProductListModelView.swift
//  orderfaz
//
//  Created by User on 28/07/23.
//

import Foundation
import Combine

@MainActor
class ProductListViewModel:ObservableObject {
    
    @Published var products:[ProductViewModel] = []
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
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink { [weak self] term in
                   
                Task {
                    DispatchQueue.main.async {
                        self?.loading = true
                    }
                    self?.products.removeAll()
                    self?.offset = 0
                    self?.hasMore = true
                    await self?.fetch(for: term)
                    
                    DispatchQueue.main.async {
                         self?.loading = false
                    }
                }
                
               
            }.store(in: &subscriptions)
    }
    
    func refresh() {
        Task {
            DispatchQueue.main.async {
                self.loading = true
            }
            self.offset = 0
           await fetch(for: search)
            
            DispatchQueue.main.async {
                 self.loading = false
            }
        }
    }
    
    func loadMore() {
        if self.hasMore {
            Task {
                self.offset += 10
                await fetch(for: search)
            }
        }
      
    }
    
    func fetch(for search:String) async {
        do {
            try await ProductService().fetch(
                search: search,
                offset: self.offset,
                limit: self.limit
            ) { [weak self] result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async{
                        let currentPage = data.pagination?.currentPage
                        let lastPage = data.pagination?.lastPage
                        let products = data.products ?? []
                        
                        self?.products.append(contentsOf: products.map(ProductViewModel.init))
                        
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
}

struct ProductViewModel {
    let product:Products
    
    var id:String {
        product.id ?? ""
    }
    
    var name:String {
        product.productName ?? ""
    }
    
    var price:String {
        String(product.productPriceUnit ?? 0)
    }
    
    
    var imageUrl:String {
        product.productImage?.first ?? ""
    }
    
    var checkoutUrl:String {
        product.checkoutUrl ?? ""
    }
    
    var weight:Int {
        product.productVariant?.first?.variantWeight ?? 0
    }
}
