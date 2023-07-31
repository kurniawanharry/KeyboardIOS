//
//  SearchLocation.swift
//  orderfaz
//
//  Created by User on 24/07/23.
//

import Foundation
import SwiftUI

struct SearchLocation: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var loc: locationTemp
    @StateObject private var locationVM = LocationListViewModel()
    var isOrigin:Bool = false
    
    
    var body: some View {
        List(locationVM.location, id: \.id) {
            location in
            HStack {
                Image(systemName: "mappin")
                    .foregroundColor(Color(0xFF2653EB))
                Text("\(location.district), \(location.subDistric), \(location.city), \(location.province), \(location.postalCode)")
            }.onTapGesture {
                if isOrigin {
                    self.loc.origin = "\(location.district), \(location.subDistric), \(location.city), \(location.province), \(location.postalCode)"
                    self.loc.originPostalCode = location.postalCode
                } else {
                    self.loc.destination = "\(location.district), \(location.subDistric), \(location.city), \(location.province), \(location.postalCode)"
                    self.loc.destinationPostalCode = location.postalCode
                }
                self.presentationMode.wrappedValue.dismiss()
                
            }
            .listSectionSeparator(.hidden)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .searchable(text: $locationVM.search)
    }
}

struct SearchLocation_Previews: PreviewProvider {
    static var previews: some View {
        SearchLocation()
    }
}
