//
//  OrderScreen.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation
import KeyboardKit
import SwiftUI

struct OrderScreen: View {
    
    @StateObject var orders = OrderListViewModel()
    
    unowned var controller: KeyboardInputViewController
    
    @FocusState private var isFocused:Bool
    
    var body: some View {
        VStack {
            KeyboardTextField("Cari Order..", text: $orders.search, controller: controller)
                .focused($isFocused, doneButton: doneButton)
                .frame(height: 30)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 20))
            
            if orders.loading {
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
                        orders.getText(orderId: orderId, categoryId: orderStatusCategory(value: orderStatusId)) {result in
                            switch result {
                            case .success(let data):
                                controller.insertText(data)
                            case .failure(_):
                                controller.insertText("")
                            }
                        }
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
        .navigationTitle("Order")
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct OrderScreen_Previews: PreviewProvider {
    static var previews: some View {
        OrderScreen(controller: KeyboardInputViewController())
    }
}
