//
//  RadioButtonGroup.swift
//  orderfaz
//
//  Created by User on 26/07/23.
//

import Foundation
import SwiftUI

enum PaymentMethod: String {
    case paymentLink = "Payment Link"
    case cash = "Cash"
    case selfAccount = "Rekening Pribadi"
}

struct RadioButtonGroups: View {
    let callback: (String) -> ()
    
    @State var selectedId: String = PaymentMethod.paymentLink.rawValue
    
    var body: some View {
        HStack {
            radioPaymentLinkMajority
            radioCashMajority
            radioSelfAccontMajority
        }
    }
    
    var radioPaymentLinkMajority: some View {
        RadioButtonField(
            id: PaymentMethod.paymentLink.rawValue,
            label: PaymentMethod.paymentLink.rawValue,
            isMarked: selectedId == PaymentMethod.paymentLink.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioCashMajority: some View {
        RadioButtonField(
            id: PaymentMethod.cash.rawValue,
            label: PaymentMethod.cash.rawValue,
            isMarked: selectedId == PaymentMethod.cash.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioSelfAccontMajority: some View {
        RadioButtonField(
            id: PaymentMethod.selfAccount.rawValue,
            label: PaymentMethod.selfAccount.rawValue,
            isMarked: selectedId == PaymentMethod.selfAccount.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}
