//
//  ProductBump.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation

struct ProductBump: Codable {

  var name        : String? = nil
  var imageUrl    : String? = nil
  var description : String? = nil
  var price       : Int?    = nil
  var weight      : Int?    = nil
  var width       : Int?    = nil
  var lenght      : Int?    = nil
  var height      : Int?    = nil
  var type        : Int?    = nil

  enum CodingKeys: String, CodingKey {

    case name        = "name"
    case imageUrl    = "imageUrl"
    case description = "description"
    case price       = "price"
    case weight      = "weight"
    case width       = "width"
    case lenght      = "lenght"
    case height      = "height"
    case type        = "type"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    name        = try values.decodeIfPresent(String.self , forKey: .name        )
    imageUrl    = try values.decodeIfPresent(String.self , forKey: .imageUrl    )
    description = try values.decodeIfPresent(String.self , forKey: .description )
    price       = try values.decodeIfPresent(Int.self    , forKey: .price       )
    weight      = try values.decodeIfPresent(Int.self    , forKey: .weight      )
    width       = try values.decodeIfPresent(Int.self    , forKey: .width       )
    lenght      = try values.decodeIfPresent(Int.self    , forKey: .lenght      )
    height      = try values.decodeIfPresent(Int.self    , forKey: .height      )
    type        = try values.decodeIfPresent(Int.self    , forKey: .type        )
 
  }

  init() {

  }

}
