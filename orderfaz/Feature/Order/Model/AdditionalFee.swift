//
//  AdditionalFee.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//


import Foundation

struct AdditionalFee: Codable {

  var name       : String? = nil
  var percentage : Float? = nil
  var amount     : Int?    = nil

  enum CodingKeys: String, CodingKey {

    case name       = "name"
    case percentage = "percentage"
    case amount     = "amount"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    name       = try values.decodeIfPresent(String.self , forKey: .name       )
    percentage = try values.decodeIfPresent(Float.self , forKey: .percentage )
    amount     = try values.decodeIfPresent(Int.self    , forKey: .amount     )
 
  }

  init() {

  }

}
