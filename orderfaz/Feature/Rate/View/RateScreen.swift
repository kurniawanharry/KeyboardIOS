//
//  RateItem.swift
//  orderfaz
//
//  Created by User on 24/07/23.
//

import Foundation
import KeyboardKit
import SwiftUI

class locationTemp:ObservableObject {
    @Published var origin:String = ""
    @Published var originPostalCode:String = ""
    @Published var destination:String = ""
    @Published var destinationPostalCode:String = ""
    @Published var weight = NumbersOnly()
    
    func clear() {
        origin = "";
        originPostalCode = "";
        destination = "";
        destinationPostalCode = "";
        weight.value = "";
    }
}

struct RateScreen: View {
    @StateObject private var rateVM = RateListViewModel()
    @StateObject var loc = locationTemp()
    @State private var selection: String = "Kg"
    @State private var showRates:Bool = false
    
    unowned var controller: KeyboardInputViewController
    
    @FocusState private var isFocused:Bool
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading,spacing: 5){
                    
                    Text("Asal").font(.system(size: 16))
                    NavigationLink(
                        destination:  SearchLocation(controller: controller,location: $loc.origin,postalCode: $loc.originPostalCode)) {
                            TextField (
                                "Kelurahan, Kecamatan, Kota, Provinsi, Kode Pos",
                                text: $loc.origin
                            )
                        }.padding(.bottom,10)
                    
                    
                    Text("Tujuan").font(.system(size: 16))
                    NavigationLink(
                        destination:  SearchLocation(controller: controller, location: $loc.destination, postalCode: $loc.destinationPostalCode)) {
                            TextField (
                                "Kelurahan, Kecamatan, Kota, Provinsi, Kode Pos",
                                text: $loc.destination
                            ).disabled(false)
                        }.padding(.bottom,10)
                    
                    
                    Text("Berat").font(.system(size: 16))
                    HStack {
                        KeyboardTextField("Berat", text:  $loc.weight.value, controller: controller)
                            .focused($isFocused, doneButton: doneButton)
                            .frame(height: 30)
                            .keyboardType(.numberPad)
                        
                        
                        Dropdown(
                            content: ["Kg","g"],
                            selection: $selection,
                            activeTint: .primary.opacity(0.1),
                            inActiveTint:  .primary.opacity(0.05),
                            dynamic: false
                        )
                        .frame(width: 80)
                        
                    }.padding(.bottom,40)
                    
                    
                    Button("Cek Ongkir") {
                        if !loc.origin.isEmpty &&
                            !loc.destination.isEmpty {
                            rateVM.rate.removeAll()
                            
                            let request = RateRequest(
                                destinationPostalCode: loc.destinationPostalCode,
                                itemPrice:1000,
                                originPostalCode: loc.originPostalCode,
                                packageTypeId: 1,
                                shipmentType: "PICKUP",
                                weight: weightCalculation(value: Int(loc.weight.value) ?? 1000, type: selection)
                            )
                            
                            Task {
                                await rateVM.fetch(request: request)
                                loc.clear()
                                isFocused.toggle()
                                showRates.toggle()
                            }
                            
                        }
                    }
                    .buttonStyle(NormalButton())
                    .sheet(isPresented: $showRates) {
                        ShippingListView(rates: rateVM.rate)
                            .presentationDragIndicator(.visible)
                            .presentationDetents([.medium, .large])
                    }
                    Spacer()
                }
                .padding(15)
                .textFieldStyle(.roundedBorder)
                .frame(alignment: .top)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Cek Ongkir")
                .toolbarBackground(.visible, for: .navigationBar)
            }
            .environmentObject(loc)
            
            if isFocused {
                SystemKeyboard(
                    controller: controller,
                    autocompleteToolbar: .none
                )
                .background(Color(0xE5E5E5))
            }
        }
    }
}

struct RateItem_Previews: PreviewProvider {
    static var previews: some View {
        RateScreen(controller: KeyboardInputViewController())
    }
}
