//
//  PromoSnapshot.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation

struct PromoSnapshot: Codable {

  var id               : String? = nil
  var name             : String? = nil
  var code             : String? = nil
  var startDate        : Int? = nil
  var endDate          : Int? = nil
  var discountFor      : Int?    = nil
  var minAmount        : Int? = nil
  var minOrder         : Int? = nil
  var isActive         : Bool?   = nil
  var usageLimitGlobal : Int? = nil
  var maxAmount        : Int? = nil
  var percentage       : Float? = nil
  var usage            : Int? = nil
  var fixedAmount      : Int? = nil
  var minPurchaseType  : Int? = nil
  var createdAt        : Int?    = nil
  var createdBy        : String? = nil

  enum CodingKeys: String, CodingKey {

    case id               = "id"
    case name             = "name"
    case code             = "code"
    case startDate        = "startDate"
    case endDate          = "endDate"
    case discountFor      = "discountFor"
    case minAmount        = "minAmount"
    case minOrder         = "minOrder"
    case isActive         = "isActive"
    case usageLimitGlobal = "usageLimitGlobal"
    case maxAmount        = "maxAmount"
    case percentage       = "percentage"
    case usage            = "usage"
    case fixedAmount      = "fixedAmount"
    case minPurchaseType  = "minPurchaseType"
    case createdAt        = "createdAt"
    case createdBy        = "createdBy"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id               = try values.decodeIfPresent(String.self , forKey: .id               )
    name             = try values.decodeIfPresent(String.self , forKey: .name             )
    code             = try values.decodeIfPresent(String.self , forKey: .code             )
    startDate        = try values.decodeIfPresent(Int.self , forKey: .startDate        )
    endDate          = try values.decodeIfPresent(Int.self , forKey: .endDate          )
    discountFor      = try values.decodeIfPresent(Int.self    , forKey: .discountFor      )
    minAmount        = try values.decodeIfPresent(Int.self , forKey: .minAmount        )
    minOrder         = try values.decodeIfPresent(Int.self , forKey: .minOrder         )
    isActive         = try values.decodeIfPresent(Bool.self   , forKey: .isActive         )
    usageLimitGlobal = try values.decodeIfPresent(Int.self , forKey: .usageLimitGlobal )
    maxAmount        = try values.decodeIfPresent(Int.self , forKey: .maxAmount        )
    percentage       = try values.decodeIfPresent(Float.self , forKey: .percentage       )
    usage            = try values.decodeIfPresent(Int.self , forKey: .usage            )
    fixedAmount      = try values.decodeIfPresent(Int.self , forKey: .fixedAmount      )
    minPurchaseType  = try values.decodeIfPresent(Int.self , forKey: .minPurchaseType  )
    createdAt        = try values.decodeIfPresent(Int.self    , forKey: .createdAt        )
    createdBy        = try values.decodeIfPresent(String.self , forKey: .createdBy        )
 
  }

  init() {

  }

}
