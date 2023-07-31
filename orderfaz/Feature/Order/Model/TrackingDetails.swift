//
//  TrackingDetails.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation

struct TrackingDetails: Codable {

  var awbNumber       : String?     = nil
  var deliveredAt     : Int?        = nil
  var destination     : String?     = nil
  var dispatchAt      : String?     = nil
  var driverInfo      : DriverInfo? = DriverInfo()
  var origin          : String?     = nil
  var trackingCode    : String?     = nil
  var trackingHistory : String?     = nil
  var trackingUrl     : String?     = nil
  var weight          : Int?        = nil

  enum CodingKeys: String, CodingKey {

    case awbNumber       = "awb_number"
    case deliveredAt     = "delivered_at"
    case destination     = "destination"
    case dispatchAt      = "dispatch_at"
    case driverInfo      = "driver_info"
    case origin          = "origin"
    case trackingCode    = "tracking_code"
    case trackingHistory = "tracking_history"
    case trackingUrl     = "tracking_url"
    case weight          = "weight"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    awbNumber       = try values.decodeIfPresent(String.self     , forKey: .awbNumber       )
    deliveredAt     = try values.decodeIfPresent(Int.self        , forKey: .deliveredAt     )
    destination     = try values.decodeIfPresent(String.self     , forKey: .destination     )
    dispatchAt      = try values.decodeIfPresent(String.self     , forKey: .dispatchAt      )
    driverInfo      = try values.decodeIfPresent(DriverInfo.self , forKey: .driverInfo      )
    origin          = try values.decodeIfPresent(String.self     , forKey: .origin          )
    trackingCode    = try values.decodeIfPresent(String.self     , forKey: .trackingCode    )
    trackingHistory = try values.decodeIfPresent(String.self     , forKey: .trackingHistory )
    trackingUrl     = try values.decodeIfPresent(String.self     , forKey: .trackingUrl     )
    weight          = try values.decodeIfPresent(Int.self        , forKey: .weight          )
 
  }

  init() {

  }

}
