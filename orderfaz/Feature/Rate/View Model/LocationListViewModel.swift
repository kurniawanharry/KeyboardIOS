//
//  LocationListViewModel.swift
//  orderfaz
//
//  Created by User on 25/07/23.
//

import Foundation
import Combine

@MainActor
class LocationListViewModel:ObservableObject {
    
    @Published var location:[LocationViewModel] = []
    @Published var search:String = ""
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        $search
            .dropFirst()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink {[weak self] term in
                Task {
                    if !term.isEmpty && term.count > 3 {
                        await self?.search(for: term)
                    } else {
                        self?.location.removeAll()
                    }
                }
            }.store(in: &subscriptions)
    }
    
    func search(for search:String) async {
        do {
            let location = try await LocationService().getLocation(search: search)
            self.location = location.map(LocationViewModel.init)
        } catch {
            print(error)
        }
    }
}


struct LocationViewModel {
    let location: Location
    
    var id: Int {
        location.id ?? 0
    }
    
    var city: String {
        location.city ?? ""
    }
    
    var district: String {
        location.district ?? ""
    }
    
    var province: String {
        location.province ?? ""
    }
    
    var subDistric: String {
        location.subDistrict ?? ""
    }
    
    var postalCode: String {
        location.postalCode ?? ""
    }
}
