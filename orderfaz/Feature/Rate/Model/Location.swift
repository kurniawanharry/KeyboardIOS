//
//  Location.swift
//  orderfaz
//
//  Created by User on 25/07/23.
//

import Foundation

struct Location: Codable {

  var id          : Int?    = nil
  var postalCode  : String? = nil
  var subDistrict : String? = nil
  var district    : String? = nil
  var city        : String? = nil
  var province    : String? = nil

  enum CodingKeys: String, CodingKey {

    case id          = "id"
    case postalCode  = "postalCode"
    case subDistrict = "subDistrict"
    case district    = "district"
    case city        = "city"
    case province    = "province"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id          = try values.decodeIfPresent(Int.self    , forKey: .id          )
    postalCode  = try values.decodeIfPresent(String.self , forKey: .postalCode  )
    subDistrict = try values.decodeIfPresent(String.self , forKey: .subDistrict )
    district    = try values.decodeIfPresent(String.self , forKey: .district    )
    city        = try values.decodeIfPresent(String.self , forKey: .city        )
    province    = try values.decodeIfPresent(String.self , forKey: .province    )
 
  }

  init() {

  }

}
