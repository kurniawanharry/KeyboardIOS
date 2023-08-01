//
//  Enum.swift
//  orderfaz
//
//  Created by User on 27/07/23.
//

import Foundation
import Combine


enum CurrentState {
       case idle
       case loading
       case loadedAll
       case error(Error)
   }

enum NetworkError: Error {
    case badeUrl
    case badId
    case invalidResponse
}

enum Channels: String, CaseIterable, Identifiable {
    case none
    case waB
    case wa
    case ig
    case line
    case fb
    case sc
    case bc
    case tc
    var id: Self { return self }
    
    var title: String {
        switch self {
        case .none:
            return "Belum ada"
        case .waB:
            return "WhatsApp Business"
        case .wa:
            return "WhatsApp"
        case .ig:
            return "Instagram"
        case .line:
            return "Line"
        case .fb:
            return "Facebook Massenger"
        case .sc:
            return "Shopee Chat"
        case .bc:
            return "Bukalapak Chat"
        case .tc:
            return "Tokopedia Chat"
        }
    }
}

enum ToastStyle {
  case error
  case warning
  case success
  case info
}

enum SelectionList {
    case autoText
    case product
    case rate
    case order
    case invoice
}
