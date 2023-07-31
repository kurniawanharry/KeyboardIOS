//
//  RateItem.swift
//  orderfaz
//
//  Created by User on 24/07/23.
//

import Foundation
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
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading,spacing: 5){
                
                Text("Asal").font(.system(size: 16))
                NavigationLink(
                    destination:  SearchLocation(isOrigin: true),
                    label: {
                    TextField (
                        "Kelurahan, Kecamatan, Kota, Provinsi, Kode Pos",
                        text: $loc.origin
                    )
                    }).padding(.bottom,10)
                
                Text("Tujuan").font(.system(size: 16))
                NavigationLink(
                    destination:  SearchLocation(isOrigin: false),
                    label: {
                    TextField (
                        "Kelurahan, Kecamatan, Kota, Provinsi, Kode Pos",
                        text: $loc.destination
                    )
                }).padding(.bottom,10)
                
                
                Text("Berat").font(.system(size: 16))
                HStack {
                    TextField (
                        "Berat",
                        text: $loc.weight.value
                        
                    )
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
                            showRates.toggle()
                        }
                        
                    }
                }
                .buttonStyle(NormalButton())
                .sheet(isPresented: $showRates) {
                    ShippingListView(rates: rateVM.rate)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.medium])
                }
                Spacer()
            }
            .padding(15)
            .textFieldStyle(.roundedBorder)
            .frame(alignment: .top)
            .navigationTitle("Cek Ongkir")
        }
        .environmentObject(loc)
     
    }
}

struct RateItem_Previews: PreviewProvider {
    static var previews: some View {
        RateScreen()
    }
}
