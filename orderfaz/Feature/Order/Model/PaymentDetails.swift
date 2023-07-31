//
//  PaymentDetails.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation

struct PaymentDetails: Codable {

  var id                : String? = nil
  var status            : Int?    = nil
  var paymentType       : String? = nil
  var paymentProvider   : String? = nil
  var paymentOrderType  : Int?    = nil
  var isSelected        : Bool?   = nil
  var orderId           : String? = nil
  var transactionValue  : Int?    = nil
  var paymentFee        : Int?    = nil
  var paymentFeePPN     : Int?    = nil
  var paymentFeeByBuyer : Bool?   = nil
  var disburseValue     : Int?    = nil
  var amount            : Int?    = nil
  var uniqueCode        : String? = nil

  enum CodingKeys: String, CodingKey {

    case id                = "id"
    case status            = "status"
    case paymentType       = "paymentType"
    case paymentProvider   = "paymentProvider"
    case paymentOrderType  = "paymentOrderType"
    case isSelected        = "isSelected"
    case orderId           = "orderId"
    case transactionValue  = "transactionValue"
    case paymentFee        = "paymentFee"
    case paymentFeePPN     = "paymentFeePPN"
    case paymentFeeByBuyer = "paymentFeeByBuyer"
    case disburseValue     = "disburseValue"
    case amount            = "amount"
    case uniqueCode        = "uniqueCode"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id                = try values.decodeIfPresent(String.self , forKey: .id                )
    status            = try values.decodeIfPresent(Int.self    , forKey: .status            )
    paymentType       = try values.decodeIfPresent(String.self , forKey: .paymentType       )
    paymentProvider   = try values.decodeIfPresent(String.self , forKey: .paymentProvider   )
    paymentOrderType  = try values.decodeIfPresent(Int.self    , forKey: .paymentOrderType  )
    isSelected        = try values.decodeIfPresent(Bool.self   , forKey: .isSelected        )
    orderId           = try values.decodeIfPresent(String.self , forKey: .orderId           )
    transactionValue  = try values.decodeIfPresent(Int.self    , forKey: .transactionValue  )
    paymentFee        = try values.decodeIfPresent(Int.self    , forKey: .paymentFee        )
    paymentFeePPN     = try values.decodeIfPresent(Int.self    , forKey: .paymentFeePPN     )
    paymentFeeByBuyer = try values.decodeIfPresent(Bool.self   , forKey: .paymentFeeByBuyer )
    disburseValue     = try values.decodeIfPresent(Int.self    , forKey: .disburseValue     )
    amount            = try values.decodeIfPresent(Int.self    , forKey: .amount            )
    uniqueCode        = try values.decodeIfPresent(String.self , forKey: .uniqueCode        )
 
  }

  init() {

  }

}
