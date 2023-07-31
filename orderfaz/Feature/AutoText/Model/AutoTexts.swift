//
//  AutoText.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation

struct AutoTexts: Codable {

  var id          : String? = nil
  var name        : String? = nil
  var content     : String? = nil
  var isDefault   : Bool?   = nil
  var isActive    : Bool?   = nil
  var isSuspended : Bool?   = nil
  var text        : Int?    = nil
  var createdAt   : String? = nil
  var createdBy   : String? = nil

  enum CodingKeys: String, CodingKey {

    case id          = "id"
    case name        = "name"
    case content     = "content"
    case isDefault   = "isDefault"
    case isActive    = "isActive"
    case isSuspended = "isSuspended"
    case text        = "text"
    case createdAt   = "createdAt"
    case createdBy   = "createdBy"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id          = try values.decodeIfPresent(String.self , forKey: .id          )
    name        = try values.decodeIfPresent(String.self , forKey: .name        )
    content     = try values.decodeIfPresent(String.self , forKey: .content     )
    isDefault   = try values.decodeIfPresent(Bool.self   , forKey: .isDefault   )
    isActive    = try values.decodeIfPresent(Bool.self   , forKey: .isActive    )
    isSuspended = try values.decodeIfPresent(Bool.self   , forKey: .isSuspended )
    text        = try values.decodeIfPresent(Int.self    , forKey: .text        )
    createdAt   = try values.decodeIfPresent(String.self , forKey: .createdAt   )
    createdBy   = try values.decodeIfPresent(String.self , forKey: .createdBy   )
 
  }

  init() {

  }

}
