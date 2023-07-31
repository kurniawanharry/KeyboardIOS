//
//  AutoTextResponse.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation

struct AutoTextResponse: Codable {

  var autoTexts  : [AutoTexts]? = []
  var pagination : Pagination?  = Pagination()

  enum CodingKeys: String, CodingKey {

    case autoTexts  = "autoTexts"
    case pagination = "pagination"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    autoTexts  = try values.decodeIfPresent([AutoTexts].self , forKey: .autoTexts  )
    pagination = try values.decodeIfPresent(Pagination.self  , forKey: .pagination )
 
  }

  init() {

  }

}
