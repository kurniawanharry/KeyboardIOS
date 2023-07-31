//
//  VariantCategory.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//


import Foundation

struct VariantCategory: Codable {

  var name    : String? = nil
  var content : String? = nil

  enum CodingKeys: String, CodingKey {

    case name    = "name"
    case content = "content"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    name    = try values.decodeIfPresent(String.self , forKey: .name    )
    content = try values.decodeIfPresent(String.self , forKey: .content )
 
  }

  init() {

  }

}
