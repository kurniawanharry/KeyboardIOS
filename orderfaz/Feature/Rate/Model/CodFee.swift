//
//  CodFee.swift
//  orderfaz
//
//  Created by User on 25/07/23.
//

import Foundation

struct CodFee: Codable {

  var percentage : Int? = nil
  var amount     : Int? = nil

  enum CodingKeys: String, CodingKey {

    case percentage = "percentage"
    case amount     = "amount"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    percentage = try values.decodeIfPresent(Int.self , forKey: .percentage )
    amount     = try values.decodeIfPresent(Int.self , forKey: .amount     )
 
  }

  init() {

  }

}
