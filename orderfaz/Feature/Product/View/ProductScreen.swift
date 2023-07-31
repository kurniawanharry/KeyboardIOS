//
//  ProductScreen.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation
import SwiftUI

struct ProductScreen: View {
    @StateObject private var productVm = ProductListViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if productVm.loading {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else {
                    ProductListView(
                        product: productVm.products,
                        loadMore: {
                            productVm.loadMore()
                        },
                        loadMoreCondition: productVm.products.count > 9 && productVm.hasMore
                    )
                }
            }
            .searchable(text: $productVm.search)
            .navigationTitle("Product")
        }
    }
}

struct ProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductScreen()
    }
}
