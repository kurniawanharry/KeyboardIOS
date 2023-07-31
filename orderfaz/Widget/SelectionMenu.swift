//
//  SelectionMenu.swift
//  orderfaz
//
//  Created by User on 27/07/23.
//

import Foundation
import SwiftUI



struct SelectionMenu: View {
    @State private var selectedSorting = Channels.none
    @State private var isOptionedPressed:Bool=false
   
    var body: some View {
        Menu {
            Picker("Sort", selection: $selectedSorting) {
                ForEach(Channels.allCases) {
                    Text($0.title)
                }
            }
        } label: {
            Button(action: {
                withAnimation {
                    self.isOptionedPressed.toggle()
                }
            }) {
                HStack {
                    Text(selectedSorting.title)
                        .fontWeight(.medium)
                        .foregroundColor(selectedSorting == Channels.none ? .gray : .black)
                    
                    Spacer()

                    Image(systemName: self.isOptionedPressed ? "chevron.up" : "chevron.down")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray,lineWidth: 2)
            }
        }
        .menuStyle(.automatic)
    }
}


struct SelectionMenu_Previews: PreviewProvider {
    static var previews: some View {
        SelectionMenu()
    }
}



