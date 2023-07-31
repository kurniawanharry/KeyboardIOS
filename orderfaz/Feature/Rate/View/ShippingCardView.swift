//
//  RateResult.swift
//  orderfaz
//
//  Created by User on 26/07/23.
//

import Foundation
import SwiftUI

struct ShippingCardView: View {
    let rate:Rate

    var body: some View {
        VStack(alignment: .leading) {
            ImageUrl(url: rate.logisticLogoUrl ?? "") {image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(5)
                    .clipped()
            }.frame(width: 40, height:40)
            VStack(alignment: .leading,spacing: 5) {
                ForEach(rate.logisticDetails!, id: \.signature) { detail in
                    Text("Rp.\(detail.price ?? 0) \(detail.logisticRate ?? "") \(date(min: detail.minDuration ?? 0, max: detail.maxDuration ?? 0, type: detail.durationType ?? ""))")
                    if detail.cashback?.amount != 0 {
                        HStack {
                            Image(systemName: "percent")
                            Text("Cashback Rp.\(detail.cashback?.amount ?? 0)")
                        }
                        .foregroundColor(.yellow)
                    }
                }
                .font(.system(size: 14))
            }
        }
        .padding(0)
    }
    
    func date(min:Int, max:Int, type:String) -> String {
        if min == max {
            return "(\(min) \(durationMethod(type: type)))"
        } else {
            return "(\(min) - \(max) \(durationMethod(type: type)))"
        }
    }
}

struct RateResult_Previews: PreviewProvider {
    static var previews: some View {
        ShippingCardView(rate: Rate())
    }
}
