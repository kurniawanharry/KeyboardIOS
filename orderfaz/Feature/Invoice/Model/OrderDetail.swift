//
//  OrderDetail.swift
//  orderfaz
//
//  Created by User on 27/07/23.
//

import Foundation

struct OrderDetail: Codable {

  var storeId               : String?                  = nil
  var channelProvider       : String?                  = nil
  var channelName           : String?                  = nil
  var customerName          : String?                  = nil
  var customerPhone         : String?                  = nil
  var customerEmail         : String?                  = nil
  var productBundleSnapshot : [ProductBundleSnapshots]? = []

  enum CodingKeys: String, CodingKey {

    case storeId               = "storeId"
    case channelProvider       = "channelProvider"
    case channelName           = "channelName"
    case customerName          = "customerName"
    case customerPhone         = "customerPhone"
    case customerEmail         = "customerEmail"
    case productBundleSnapshot = "productBundleSnapshot"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    storeId               = try values.decodeIfPresent(String.self                  , forKey: .storeId               )
    channelProvider       = try values.decodeIfPresent(String.self                  , forKey: .channelProvider       )
    channelName           = try values.decodeIfPresent(String.self                  , forKey: .channelName           )
    customerName          = try values.decodeIfPresent(String.self                  , forKey: .customerName          )
    customerPhone         = try values.decodeIfPresent(String.self                  , forKey: .customerPhone         )
    customerEmail         = try values.decodeIfPresent(String.self                  , forKey: .customerEmail         )
    productBundleSnapshot = try values.decodeIfPresent([ProductBundleSnapshots].self , forKey: .productBundleSnapshot )
 
  }

  init() {

  }

}
