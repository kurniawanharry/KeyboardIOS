//
//  RateListViewModel.swift
//  orderfaz
//
//  Created by User on 25/07/23.
//

import Foundation

@MainActor
class RateListViewModel:ObservableObject {
    @Published var rate:[RateViewModel] = []
    
    func fetch(request:RateRequest) async {
        do {
            try await LocationService().getRates(rateReq: request) {result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async{
                        self.rate = data.map(RateViewModel.init)
                    }
                case .failure(_):
                    self.rate = [].map(RateViewModel.init)
                }
            }
        } catch {
            print(error)
        }
    }
}

struct RateViewModel {
    let rate:Rate
    
    var id:String {
        UUID().uuidString
    }
    
    var logisticNamed:String {
        rate.logisticName ?? ""
    }
    
    var logisticUrl:String {
        rate.logisticLogoUrl ?? ""
    }
    
    var logisticDetails:[LogisticDetails] {
        rate.logisticDetails ?? []
    }
}
