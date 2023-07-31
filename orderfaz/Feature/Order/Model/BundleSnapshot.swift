//
//  BundleSnapshot.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation

struct ProductBundleSnapshot: Codable {

  var id                       : Int?               = nil
  var shipmentStatus           : Int?               = nil
  var paymentStatus            : Int?               = nil
  var awbNumber                : String?            = nil
  var createdAt                : String?            = nil
  var trackingDetails          : TrackingDetails?   = TrackingDetails()
  var customValue              : Int?               = nil
  var bundleOrderValue         : Int?               = nil
  var bundlePackagePrice       : Int?               = nil
  var bundleServicePrice       : Int?               = nil
  var shipmentTransactionValue : Int?               = nil
  var gmvShipment              : Int?               = nil
  var bundleTransactionValue   : Int?               = nil
  var bundleGmvOrder           : Int?               = nil
  var additionalFees           : [AdditionalFee]?   = []
  var productSnapshot          : [Products]?        = []
  var productBump              : ProductBump?       = ProductBump()
  var shipmentSnapshot         : ShipmentSnapshot?  = ShipmentSnapshot()

  enum CodingKeys: String, CodingKey {

    case id                       = "id"
    case shipmentStatus           = "shipmentStatus"
    case paymentStatus            = "paymentStatus"
    case awbNumber                = "awbNumber"
    case createdAt                = "createdAt"
    case trackingDetails          = "trackingDetails"
    case customValue              = "customValue"
    case bundleOrderValue         = "bundleOrderValue"
    case bundlePackagePrice       = "bundlePackagePrice"
    case bundleServicePrice       = "bundleServicePrice"
    case shipmentTransactionValue = "shipmentTransactionValue"
    case gmvShipment              = "gmvShipment"
    case bundleTransactionValue   = "bundleTransactionValue"
    case bundleGmvOrder           = "bundleGmvOrder"
    case additionalFees           = "additionalFees"
    case productSnapshot          = "productSnapshot"
    case productBump              = "productBump"
    case shipmentSnapshot         = "shipmentSnapshot"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id                       = try values.decodeIfPresent(Int.self               , forKey: .id                       )
    shipmentStatus           = try values.decodeIfPresent(Int.self               , forKey: .shipmentStatus           )
    paymentStatus            = try values.decodeIfPresent(Int.self               , forKey: .paymentStatus            )
    awbNumber                = try values.decodeIfPresent(String.self            , forKey: .awbNumber                )
    createdAt                = try values.decodeIfPresent(String.self            , forKey: .createdAt                )
    trackingDetails          = try values.decodeIfPresent(TrackingDetails.self   , forKey: .trackingDetails          )
    customValue              = try values.decodeIfPresent(Int.self               , forKey: .customValue              )
    bundleOrderValue         = try values.decodeIfPresent(Int.self               , forKey: .bundleOrderValue         )
    bundlePackagePrice       = try values.decodeIfPresent(Int.self               , forKey: .bundlePackagePrice       )
    bundleServicePrice       = try values.decodeIfPresent(Int.self               , forKey: .bundleServicePrice       )
    shipmentTransactionValue = try values.decodeIfPresent(Int.self               , forKey: .shipmentTransactionValue )
    gmvShipment              = try values.decodeIfPresent(Int.self               , forKey: .gmvShipment              )
    bundleTransactionValue   = try values.decodeIfPresent(Int.self               , forKey: .bundleTransactionValue   )
    bundleGmvOrder           = try values.decodeIfPresent(Int.self               , forKey: .bundleGmvOrder           )
    additionalFees           = try values.decodeIfPresent([AdditionalFee].self   , forKey: .additionalFees           )
    productSnapshot          = try values.decodeIfPresent([Products].self        , forKey: .productSnapshot          )
    productBump              = try values.decodeIfPresent(ProductBump.self       , forKey: .productBump              )
    shipmentSnapshot         = try values.decodeIfPresent(ShipmentSnapshot.self  , forKey: .shipmentSnapshot         )
 
  }

  init() {

  }

}

