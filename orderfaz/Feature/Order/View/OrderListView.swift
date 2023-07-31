//
//  OrderListView.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation
import SwiftUI

struct OrderListView: View {
    let orders:[OrderViewModel]
    let hasMore:()->Void
    let hasMoreCondition:Bool
    let onTap:(_ orderId:String,_ orderStatusId:Int)-> Void
    var body: some View {
        List {
            ForEach(orders, id: \.id) { orders in
                OrderCardView(
                    orderId: orders.orderId,
                    status: orders.orderStatusId,
                    createdAt: orders.createdAt,
                    userName: orders.userName,
                    price: orders.transactionValue,
                    products: orders.products,
                    shipment: orders.shipment,
                    onTap: {
                        onTap(orders.orderId, orders.orderStatusId)
                    }
                )
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)
                
                if hasMoreCondition {
                    HStack(alignment: .center, spacing: 1) {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .onAppear {
                                hasMore()
                            }
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(
            orders: [],
            hasMore: {},
            hasMoreCondition: false,
            onTap: {orderId,orderStatusId in }
        )
    }
}
