//
//  NotifTextResponse.swift
//  orderfaz
//
//  Created by User on 28/07/23.
//

import Foundation

struct NotifTextResponse: Codable {

  var categoryId : Int?    = nil
  var isUse      : Bool?    = nil
  var text       : String? = nil

  enum CodingKeys: String, CodingKey {

    case categoryId = "categoryId"
    case isUse      = "isUse"
    case text       = "text"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    categoryId = try values.decodeIfPresent(Int.self    , forKey: .categoryId )
    isUse      = try values.decodeIfPresent(Bool.self    , forKey: .isUse      )
    text       = try values.decodeIfPresent(String.self , forKey: .text       )
 
  }

  init() {

  }

}
