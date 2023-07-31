//
//  LogisticDetails.swift
//  orderfaz
//
//  Created by User on 25/07/23.
//

import Foundation

struct LogisticDetails: Codable {

  var logisticRate              : String?   = nil
  var LogisticRateRank          : Int?      = nil
  var rateName                  : String?   = nil
  var rateCode                  : String?   = nil
  var RateRank                  : Int?      = nil
  var minDuration               : Int?      = nil
  var maxDuration               : Int?      = nil
  var durationType              : String?   = nil
  var price                     : Int?      = nil
  var insurancePrice            : Int?      = nil
  var isAvailableForPickupToday : Bool?     = nil
  var signature                 : String?   = nil
  var cashback                  : Cashback? = Cashback()
  var discount                  : Discount? = Discount()
  var adminFee                  : AdminFee? = AdminFee()
  var codFee                    : CodFee?   = CodFee()
  var signedKey                 : String?   = nil
  var height                    : Int?      = nil
  var width                     : Int?      = nil
  var length                    : Int?      = nil

  enum CodingKeys: String, CodingKey {

    case logisticRate              = "logisticRate"
    case LogisticRateRank          = "LogisticRateRank"
    case rateName                  = "rateName"
    case rateCode                  = "rateCode"
    case RateRank                  = "RateRank"
    case minDuration               = "minDuration"
    case maxDuration               = "maxDuration"
    case durationType              = "durationType"
    case price                     = "price"
    case insurancePrice            = "insurancePrice"
    case isAvailableForPickupToday = "isAvailableForPickupToday"
    case signature                 = "signature"
    case cashback                  = "cashback"
    case discount                  = "discount"
    case adminFee                  = "adminFee"
    case codFee                    = "codFee"
    case signedKey                 = "signedKey"
    case height                    = "height"
    case width                     = "width"
    case length                    = "length"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    logisticRate              = try values.decodeIfPresent(String.self   , forKey: .logisticRate              )
    LogisticRateRank          = try values.decodeIfPresent(Int.self      , forKey: .LogisticRateRank          )
    rateName                  = try values.decodeIfPresent(String.self   , forKey: .rateName                  )
    rateCode                  = try values.decodeIfPresent(String.self   , forKey: .rateCode                  )
    RateRank                  = try values.decodeIfPresent(Int.self      , forKey: .RateRank                  )
    minDuration               = try values.decodeIfPresent(Int.self      , forKey: .minDuration               )
    maxDuration               = try values.decodeIfPresent(Int.self      , forKey: .maxDuration               )
    durationType              = try values.decodeIfPresent(String.self   , forKey: .durationType              )
    price                     = try values.decodeIfPresent(Int.self      , forKey: .price                     )
    insurancePrice            = try values.decodeIfPresent(Int.self      , forKey: .insurancePrice            )
    isAvailableForPickupToday = try values.decodeIfPresent(Bool.self     , forKey: .isAvailableForPickupToday )
    signature                 = try values.decodeIfPresent(String.self   , forKey: .signature                 )
    cashback                  = try values.decodeIfPresent(Cashback.self , forKey: .cashback                  )
    discount                  = try values.decodeIfPresent(Discount.self , forKey: .discount                  )
    adminFee                  = try values.decodeIfPresent(AdminFee.self , forKey: .adminFee                  )
    codFee                    = try values.decodeIfPresent(CodFee.self   , forKey: .codFee                    )
    signedKey                 = try values.decodeIfPresent(String.self   , forKey: .signedKey                 )
    height                    = try values.decodeIfPresent(Int.self      , forKey: .height                    )
    width                     = try values.decodeIfPresent(Int.self      , forKey: .width                     )
    length                    = try values.decodeIfPresent(Int.self      , forKey: .length                    )
 
  }

  init() {

  }

}
