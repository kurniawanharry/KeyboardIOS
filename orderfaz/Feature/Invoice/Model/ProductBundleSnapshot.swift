//
//  ProductBundleSnapshot.swift
//  orderfaz
//
//  Created by User on 27/07/23.
//

import Foundation

struct ProductBundleSnapshots: Codable {

  var productSnapshot  : [Products]?         = []
  var additionalFees   : [AdditionalFee]?         = []
  var customValue      : Int?              = nil
  var shipmentSnapshot : ShipmentSnapshot? = ShipmentSnapshot()

  enum CodingKeys: String, CodingKey {

    case productSnapshot  = "productSnapshot"
    case additionalFees   = "additionalFees"
    case customValue      = "customValue"
    case shipmentSnapshot = "shipmentSnapshot"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    productSnapshot  = try values.decodeIfPresent([Products].self         , forKey: .productSnapshot  )
    additionalFees   = try values.decodeIfPresent([AdditionalFee].self         , forKey: .additionalFees   )
    customValue      = try values.decodeIfPresent(Int.self              , forKey: .customValue      )
    shipmentSnapshot = try values.decodeIfPresent(ShipmentSnapshot.self , forKey: .shipmentSnapshot )
 
  }

  init() {

  }

}
