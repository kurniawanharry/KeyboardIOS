//
//  OrderResponse.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation

struct OrderResponse: Codable {

  var orders     : [Orders]?   = []
  var pagination : Pagination? = Pagination()

  enum CodingKeys: String, CodingKey {

    case orders     = "orders"
    case pagination = "pagination"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    orders     = try values.decodeIfPresent([Orders].self   , forKey: .orders     )
    pagination = try values.decodeIfPresent(Pagination.self , forKey: .pagination )
 
  }

  init() {

  }

}
