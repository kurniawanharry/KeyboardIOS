//
//  OrderScreen.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation
import SwiftUI

struct OrderScreen: View {
    
    @StateObject var orders = OrderListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if(orders.loading){
                    ProgressView()
                        .progressViewStyle(.circular)
                } else {
                    OrderListView(
                        orders: orders.orders,
                        hasMore: {
                            orders.loadMore()
                        },
                        hasMoreCondition: orders.orders.count > 9 && orders.hasMore,
                        onTap: {orderId,orderStatusId in
                            orders.getText(
                                orderId: orderId,
                                categoryId: orderStatusCategory(value: orderStatusId))
                        }
                    )
                }
            }
            .searchable(text: $orders.search)
            .navigationTitle("Orders")
        }
    }
}

struct OrderScreen_Previews: PreviewProvider {
    static var previews: some View {
        OrderScreen()
    }
}
