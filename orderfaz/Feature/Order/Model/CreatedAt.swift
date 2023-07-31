//
//  CreatedAt.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation

struct CreatedAt: Codable {

  var Int64 : Int?  = nil
  var Valid : Bool? = nil

  enum CodingKeys: String, CodingKey {

    case Int64 = "Int64"
    case Valid = "Valid"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    Int64 = try values.decodeIfPresent(Int.self  , forKey: .Int64 )
    Valid = try values.decodeIfPresent(Bool.self , forKey: .Valid )
 
  }

  init() {

  }

}
