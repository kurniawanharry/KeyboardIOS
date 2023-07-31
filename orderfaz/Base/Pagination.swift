//
//  BasePagination.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation

struct Pagination: Codable {

  var total       : Int? = nil
  var perPage     : Int? = nil
  var currentPage : Int? = nil
  var lastPage    : Int? = nil

  enum CodingKeys: String, CodingKey {

    case total       = "total"
    case perPage     = "perPage"
    case currentPage = "currentPage"
    case lastPage    = "lastPage"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    total       = try values.decodeIfPresent(Int.self , forKey: .total       )
    perPage     = try values.decodeIfPresent(Int.self , forKey: .perPage     )
    currentPage = try values.decodeIfPresent(Int.self , forKey: .currentPage )
    lastPage    = try values.decodeIfPresent(Int.self , forKey: .lastPage    )
 
  }

  init() {

  }

}
