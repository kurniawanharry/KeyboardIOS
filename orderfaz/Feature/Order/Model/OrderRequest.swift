//
//  OrderRequest.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation

struct OrderRequest: Codable {

  var order              : String? = nil
  var sort               : String? = nil
  var limit              : Int?    = nil
  var offset             : Int?    = nil
  var includeOrderType   : String? = nil
  var includeOrderStatus : String? = nil
  var excludeStatus      : String? = nil
  var search             : String? = nil

  enum CodingKeys: String, CodingKey {

    case order              = "order"
    case sort               = "sort"
    case limit              = "limit"
    case offset             = "offset"
    case includeOrderType   = "includeOrderType"
    case includeOrderStatus = "includeOrderStatus"
    case excludeStatus      = "excludeStatus"
    case search             = "search"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    order              = try values.decodeIfPresent(String.self , forKey: .order              )
    sort               = try values.decodeIfPresent(String.self , forKey: .sort               )
    limit              = try values.decodeIfPresent(Int.self    , forKey: .limit              )
    offset             = try values.decodeIfPresent(Int.self    , forKey: .offset             )
    includeOrderType   = try values.decodeIfPresent(String.self , forKey: .includeOrderType   )
    includeOrderStatus = try values.decodeIfPresent(String.self , forKey: .includeOrderStatus )
    excludeStatus      = try values.decodeIfPresent(String.self , forKey: .excludeStatus      )
    search             = try values.decodeIfPresent(String.self , forKey: .search             )
 
  }

  init() {

  }

}
