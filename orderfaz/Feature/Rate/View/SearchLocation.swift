//
//  SearchLocation.swift
//  orderfaz
//
//  Created by User on 24/07/23.
//

import Foundation
import KeyboardKit
import SwiftUI

struct SearchLocation: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var locationVM = LocationListViewModel()
    
    unowned var controller: KeyboardInputViewController
    
    @FocusState private var isFocused:Bool
    
    @Binding var location:String
    
    @Binding var postalCode:String
    
    var body: some View {
        VStack {
            KeyboardTextField("Cari Lokasi..", text: $locationVM.search, controller: controller)
                .focused($isFocused, doneButton: doneButton)
                .frame(height: 30)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 20))
            
            List(locationVM.location, id: \.id) { location in
                HStack {
                    Image(systemName: "mappin")
                        .foregroundColor(Color(0xFF2653EB))
                    Text("\(location.district), \(location.subDistric), \(location.city), \(location.province), \(location.postalCode)")
                }.onTapGesture {
                    self.location = "\(location.district), \(location.subDistric), \(location.city), \(location.province), \(location.postalCode)"
                    self.postalCode = location.postalCode
                    
                    dismiss()
                    
                }
                .listSectionSeparator(.hidden)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            
            if isFocused {
                SystemKeyboard(
                    controller: controller,
                    autocompleteToolbar: .none
                )
                .background(Color(0xE5E5E5))
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Lokasi")
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.blue)
                        Text("Back")
                            .font(.system(.body, design: .rounded).bold())
                            .foregroundColor(.blue)
                    }
                }
                
            }
        }

    }
}
