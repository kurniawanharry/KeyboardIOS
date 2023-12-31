//
//  ProductListView.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation
import SwiftUI

struct ProductListView: View {
    
    let product:[ProductViewModel]
    let loadMore:(() -> Void)
    let loadMoreCondition:Bool
    let onTap:(_ url:String, _ name:String,_ price:String)-> Void
    
    var body: some View {
        List {
            ForEach(product, id: \.id) { product in
                ProductCardView(
                    name: product.name,
                    price: product.price,
                    weight: product.weight,
                    image: product.imageUrl,
                    checkoutUrl: product.checkoutUrl,
                    onTap: onTap
                )
            }
            .listRowSeparator(.hidden)
            .listSectionSeparator(.hidden)
            
            if loadMoreCondition {
                HStack(alignment: .center, spacing: 1) {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .onAppear {
                            loadMore()
                        }
                }
            }
           
        }
        .listStyle(.plain)
       
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(product: [],loadMore: {},loadMoreCondition: true,onTap: {data, dat, da in})
    }
}
