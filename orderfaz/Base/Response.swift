//
//  BaseResponse.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation

struct BaseResponse<T:Codable> : Codable{

  var status     : String? = nil
  var statusCode : Int?    = nil
  var message    : String? = nil
  var timestamp  : String? = nil
  var data       : T?   = nil

  enum CodingKeys: String, CodingKey {

    case status     = "status"
    case statusCode = "statusCode"
    case message    = "message"
    case timestamp  = "timestamp"
    case data       = "data"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    status     = try values.decodeIfPresent(String.self , forKey: .status     )
    statusCode = try values.decodeIfPresent(Int.self    , forKey: .statusCode )
    message    = try values.decodeIfPresent(String.self , forKey: .message    )
    timestamp  = try values.decodeIfPresent(String.self , forKey: .timestamp  )
    data       = try values.decodeIfPresent(T.self   , forKey: .data       )
 
  }

  init() {

  }

}
