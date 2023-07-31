//
//  ExternalData.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation

struct ExternalData: Codable {

  var externalProductId : String? = nil
  var externalShopId    : String? = nil
  var externalSourceId  : Int?    = nil

  enum CodingKeys: String, CodingKey {

    case externalProductId = "externalProductId"
    case externalShopId    = "externalShopId"
    case externalSourceId  = "externalSourceId"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    externalProductId = try values.decodeIfPresent(String.self , forKey: .externalProductId )
    externalShopId    = try values.decodeIfPresent(String.self , forKey: .externalShopId    )
    externalSourceId  = try values.decodeIfPresent(Int.self    , forKey: .externalSourceId  )
 
  }

  init() {

  }

}
