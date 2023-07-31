//
//  AutotextListViewModel.swift
//  orderfaz
//
//  Created by User on 27/07/23.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class AutotextListViewModel:ObservableObject {
    
    @Published var autoTexts:[AutoTextViewModel] = []
    @Published var loading:Bool = false
    @Published var search:String = ""
    
    var subscriptions = Set<AnyCancellable>()
    
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
                    self?.autoTexts.removeAll()
                    await self?.fetch(for: term)
                    
                    DispatchQueue.main.async {
                         self?.loading = false
                    }
                }
                
               
            }.store(in: &subscriptions)
    }
    
    func refresh()  {
        Task {
            DispatchQueue.main.async {
                self.loading = true
            }
            
           await fetch(for: search)
            
            DispatchQueue.main.async {
                self.loading = false
            }
        }
    }
    
    func fetch(for search:String) async {
        do {
            try await AutoTextService().fetch(search:search) { response in
                switch response {
                case .success(let data):
                    DispatchQueue.main.async{
                        self.autoTexts = data.map(AutoTextViewModel.init)
                    }
                case .failure(_):
                    print("Gagal")
                }
            }
        } catch {
            print(error)
        }
    }
}

struct AutoTextViewModel {
    let autotexts:AutoTexts
    
    var id:String {
        autotexts.id ?? ""
    }
    
    var title:String {
        autotexts.name ?? ""
    }
    
    var body:String {
        autotexts.content ?? ""
    }
    
    var isDefault:Bool {
        autotexts.isDefault ?? false
    }
}
