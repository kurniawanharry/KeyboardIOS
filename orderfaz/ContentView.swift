//
//  ContentView.swift
//  orderfaz
//
//  Created by User on 11/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var givenName: String = ""
    @State private var familyName: String = ""
    var body: some View {
        VStack {
            TextField (
               "Contoh",
                text: $givenName,
               axis: .vertical
            )
            .lineLimit(3)
            .padding(10)
            .background(.gray)
            .textFieldStyle(.roundedBorder)
            
            TextEditor(text: $familyName)
                .padding(10)
            
        }
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//
//        }
//        .padding()
//
//        VStack {
//               TextField(
//                   "Given Name",
//                   text: $givenName
//               )
//               .disableAutocorrection(true)
//               TextField(
//                   "Family Name",
//                   text: $familyName
//               )
//               .disableAutocorrection(true)
//        }           .textFieldStyle(.roundedBorder)
//
//        Text(givenName)
//
//
//        Button("Button") {
//            print(givenName)
//            print($familyName)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
