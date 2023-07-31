//
//  RequestOrder.swift
//  orderfaz
//
//  Created by User on 27/07/23.
//

import Foundation

struct RequestOrder: Codable {

  var orderType         : Int?          = nil
  var paymentMethod     : String?       = nil
  var expiredAt         : Int?          = nil
  var paymentFeeByBuyer : Bool?         = nil
  var orderDetails      : OrderDetail? = OrderDetail()

  enum CodingKeys: String, CodingKey {

    case orderType         = "orderType"
    case paymentMethod     = "paymentMethod"
    case expiredAt         = "expiredAt"
    case paymentFeeByBuyer = "paymentFeeByBuyer"
    case orderDetails      = "orderDetails"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    orderType         = try values.decodeIfPresent(Int.self          , forKey: .orderType         )
    paymentMethod     = try values.decodeIfPresent(String.self       , forKey: .paymentMethod     )
    expiredAt         = try values.decodeIfPresent(Int.self          , forKey: .expiredAt         )
    paymentFeeByBuyer = try values.decodeIfPresent(Bool.self         , forKey: .paymentFeeByBuyer )
    orderDetails      = try values.decodeIfPresent(OrderDetail.self , forKey: .orderDetails      )
 
  }

  init() {

  }

}
