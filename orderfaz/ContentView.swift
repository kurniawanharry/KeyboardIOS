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
        TabView {
//            AutoTextScreen().tabItem() {
//                Image(systemName: "text.bubble")
//                Text("Auto Text")
//            }
            ProductScreen().tabItem() {
                Image(systemName: "shippingbox.fill")
                Text("Product")
            }
            RateScreen().tabItem() {
                Image(systemName: "box.truck.fill")
                Text("Cek Ongkir")
            }
            OrderScreen().tabItem() {
                Image(systemName: "doc.plaintext.fill")
                Text("Order")
            }
            InvoiceScreen().tabItem() {
                Image(systemName: "doc.badge.plus")
                Text("Invoice")
            }
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
