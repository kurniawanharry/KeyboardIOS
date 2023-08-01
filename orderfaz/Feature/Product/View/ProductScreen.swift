//
//  ProductScreen.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation
import KeyboardKit
import SwiftUI

struct ProductScreen: View {
    @StateObject private var productVm = ProductListViewModel()
    
    unowned var controller: KeyboardInputViewController
    
    @FocusState private var isFocused:Bool
    
    var body: some View {
        VStack {
            KeyboardTextField("Cari Produk..", text: $productVm.search, controller: controller)
                .focused($isFocused, doneButton: doneButton)
                .frame(height: 30)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 20))
            
            if productVm.loading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                ProductListView(
                    product: productVm.products,
                    loadMore: {
                        productVm.loadMore()
                    },
                    loadMoreCondition: productVm.products.count > 9 && productVm.hasMore,
                    onTap: { url,name,price in
                        let baseUrl = Constants.HTTP + Constants.DUMMYSTORE.lowercased().replacingOccurrences(of: " ", with: "-") + Constants.DOMAIN + "\(url)"
                        let baseText = "\(name)\nHarga Produk : Rp.\(price)\n\(baseUrl)"
                        controller.insertText(baseText)
                    }
                )
            }
            
            if isFocused {
                SystemKeyboard(
                    controller: controller,
                    autocompleteToolbar: .none
                )
                .background(Color(0xE5E5E5))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Produk")
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct ProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductScreen(controller: KeyboardInputViewController())
    }
}
