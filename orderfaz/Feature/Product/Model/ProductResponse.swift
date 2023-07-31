//
//  ProductResponse.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation

struct ProductResponse: Codable {

  var products   : [Products]? = []
  var pagination : Pagination? = Pagination()

  enum CodingKeys: String, CodingKey {

    case products   = "products"
    case pagination = "pagination"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    products   = try values.decodeIfPresent([Products].self , forKey: .products   )
    pagination = try values.decodeIfPresent(Pagination.self , forKey: .pagination )
 
  }

  init() {

  }

}
