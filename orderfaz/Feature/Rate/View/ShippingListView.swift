//
//  ShippingCostList.swift
//  orderfaz
//
//  Created by User on 28/07/23.
//

import Foundation
import SwiftUI

struct ShippingListView: View {
    var rates:[RateViewModel]
    var body: some View {
        List(rates, id: \.id) { rate in
            ShippingCardView(rate: rate.rate.self)
        }
        .listStyle(.plain)
    }
}

struct ShippingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingListView(rates: [])
    }
}
