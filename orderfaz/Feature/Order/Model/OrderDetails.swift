//
//  OrderDetails.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation

struct OrderDetails: Codable {

  var goodsType             : Int?                     = nil
  var totalShipmentPrice    : Int?                     = nil
  var totalInsurancePrice   : Int?                     = nil
  var totalPackagePrice     : Int?                     = nil
  var totalServicePrice     : Int?                     = nil
  var totalAdminFee         : Int?                     = nil
  var totalCODFee           : Int?                     = nil
  var totalAdditionalFees   : Int?                     = nil
  var totalDiscount         : Int?                     = nil
  var totalCashback         : Int?                     = nil
  var totalPromoProduct     : Int?                     = nil
  var totalPromoShipment    : Int?                     = nil
  var totalPromo            : Int?                     = nil
  var promoId               : String?                  = nil
  var storeId               : String?                  = nil
  var channelProvider       : String?                  = nil
  var channelName           : String?                  = nil
  var customerName          : String?                  = nil
  var customerPhone         : String?                  = nil
  var customerEmail         : String?                  = nil
  var customerEmails        : String?                  = nil
  var productBundleSnapshot : [ProductBundleSnapshot]? = []
  var productBundle         : [ProductBundle]?         = []
  var promoSnapshot         : PromoSnapshot?           = PromoSnapshot()
  var storeName             : String?                  = nil
  var storeLink             : String?                  = nil

  enum CodingKeys: String, CodingKey {

    case goodsType             = "goodsType"
    case totalShipmentPrice    = "totalShipmentPrice"
    case totalInsurancePrice   = "totalInsurancePrice"
    case totalPackagePrice     = "totalPackagePrice"
    case totalServicePrice     = "totalServicePrice"
    case totalAdminFee         = "totalAdminFee"
    case totalCODFee           = "totalCODFee"
    case totalAdditionalFees   = "totalAdditionalFees"
    case totalDiscount         = "totalDiscount"
    case totalCashback         = "totalCashback"
    case totalPromoProduct     = "totalPromoProduct"
    case totalPromoShipment    = "totalPromoShipment"
    case totalPromo            = "totalPromo"
    case promoId               = "promoId"
    case storeId               = "storeId"
    case channelProvider       = "channelProvider"
    case channelName           = "channelName"
    case customerName          = "customerName"
    case customerPhone         = "customerPhone"
    case customerEmail         = "customerEmail"
    case customerEmails        = "customerEmails"
    case productBundleSnapshot = "productBundleSnapshot"
    case productBundle         = "productBundle"
    case promoSnapshot         = "promoSnapshot"
    case storeName             = "storeName"
    case storeLink             = "storeLink"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    goodsType             = try values.decodeIfPresent(Int.self                     , forKey: .goodsType             )
    totalShipmentPrice    = try values.decodeIfPresent(Int.self                     , forKey: .totalShipmentPrice    )
    totalInsurancePrice   = try values.decodeIfPresent(Int.self                     , forKey: .totalInsurancePrice   )
    totalPackagePrice     = try values.decodeIfPresent(Int.self                     , forKey: .totalPackagePrice     )
    totalServicePrice     = try values.decodeIfPresent(Int.self                     , forKey: .totalServicePrice     )
    totalAdminFee         = try values.decodeIfPresent(Int.self                     , forKey: .totalAdminFee         )
    totalCODFee           = try values.decodeIfPresent(Int.self                     , forKey: .totalCODFee           )
    totalAdditionalFees   = try values.decodeIfPresent(Int.self                     , forKey: .totalAdditionalFees   )
    totalDiscount         = try values.decodeIfPresent(Int.self                     , forKey: .totalDiscount         )
    totalCashback         = try values.decodeIfPresent(Int.self                     , forKey: .totalCashback         )
    totalPromoProduct     = try values.decodeIfPresent(Int.self                     , forKey: .totalPromoProduct     )
    totalPromoShipment    = try values.decodeIfPresent(Int.self                     , forKey: .totalPromoShipment    )
    totalPromo            = try values.decodeIfPresent(Int.self                     , forKey: .totalPromo            )
    promoId               = try values.decodeIfPresent(String.self                  , forKey: .promoId               )
    storeId               = try values.decodeIfPresent(String.self                  , forKey: .storeId               )
    channelProvider       = try values.decodeIfPresent(String.self                  , forKey: .channelProvider       )
    channelName           = try values.decodeIfPresent(String.self                  , forKey: .channelName           )
    customerName          = try values.decodeIfPresent(String.self                  , forKey: .customerName          )
    customerPhone         = try values.decodeIfPresent(String.self                  , forKey: .customerPhone         )
    customerEmail         = try values.decodeIfPresent(String.self                  , forKey: .customerEmail         )
    customerEmails        = try values.decodeIfPresent(String.self                  , forKey: .customerEmails        )
    productBundleSnapshot = try values.decodeIfPresent([ProductBundleSnapshot].self , forKey: .productBundleSnapshot )
    productBundle         = try values.decodeIfPresent([ProductBundle].self         , forKey: .productBundle         )
    promoSnapshot         = try values.decodeIfPresent(PromoSnapshot.self           , forKey: .promoSnapshot         )
    storeName             = try values.decodeIfPresent(String.self                  , forKey: .storeName             )
    storeLink             = try values.decodeIfPresent(String.self                  , forKey: .storeLink             )
 
  }

  init() {

  }

}
