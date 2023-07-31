//
//  Rate.swift
//  orderfaz
//
//  Created by User on 25/07/23.
//

import Foundation

struct Rate: Codable {

  var isVip           : Bool?              = nil
  var logisticName    : String?            = nil
  var logisticLogoUrl : String?            = nil
  var weight          : Int?               = nil
  var volumeWeight    : Int?               = nil
  var LogisticRank    : Int?               = nil
  var logisticDetails : [LogisticDetails]? = []

  enum CodingKeys: String, CodingKey {

    case isVip           = "isVip"
    case logisticName    = "logisticName"
    case logisticLogoUrl = "logisticLogoUrl"
    case weight          = "weight"
    case volumeWeight    = "volumeWeight"
    case LogisticRank    = "LogisticRank"
    case logisticDetails = "logisticDetails"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    isVip           = try values.decodeIfPresent(Bool.self              , forKey: .isVip           )
    logisticName    = try values.decodeIfPresent(String.self            , forKey: .logisticName    )
    logisticLogoUrl = try values.decodeIfPresent(String.self            , forKey: .logisticLogoUrl )
    weight          = try values.decodeIfPresent(Int.self               , forKey: .weight          )
    volumeWeight    = try values.decodeIfPresent(Int.self               , forKey: .volumeWeight    )
    LogisticRank    = try values.decodeIfPresent(Int.self               , forKey: .LogisticRank    )
    logisticDetails = try values.decodeIfPresent([LogisticDetails].self , forKey: .logisticDetails )
 
  }

  init() {

  }

}
