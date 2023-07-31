//
//  DriverInfo.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation

struct DriverInfo: Codable {

  var name         : String? = nil
  var phone        : String? = nil
  var photoUrl     : String? = nil
  var vehiclePlate : String? = nil

  enum CodingKeys: String, CodingKey {

    case name         = "name"
    case phone        = "phone"
    case photoUrl     = "photoUrl"
    case vehiclePlate = "vehiclePlate"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    name         = try values.decodeIfPresent(String.self , forKey: .name         )
    phone        = try values.decodeIfPresent(String.self , forKey: .phone        )
    photoUrl     = try values.decodeIfPresent(String.self , forKey: .photoUrl     )
    vehiclePlate = try values.decodeIfPresent(String.self , forKey: .vehiclePlate )
 
  }

  init() {

  }

}
