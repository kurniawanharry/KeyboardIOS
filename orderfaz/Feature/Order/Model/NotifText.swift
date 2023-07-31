//
//  NotifText.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation

struct NotifText: Codable {

  var text       : String? = nil
  var isUse      : Bool?   = nil
  var categoryId : Int?    = nil

  enum CodingKeys: String, CodingKey {

    case text       = "text"
    case isUse      = "isUse"
    case categoryId = "categoryId"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    text       = try values.decodeIfPresent(String.self , forKey: .text       )
    isUse      = try values.decodeIfPresent(Bool.self   , forKey: .isUse      )
    categoryId = try values.decodeIfPresent(Int.self    , forKey: .categoryId )
 
  }

  init() {

  }

}
