//
//  ShipmentSnapshot.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation

struct ShipmentSnapshot: Codable {

  var id                      : String?            = nil
  var orderId                 : String?            = nil
  var clientOrderNo           : String?            = nil
  var shipmentOrderNo         : String?            = nil
  var signature               : String?            = nil
  var isCod                   : Bool?              = nil
  var isSelfCourier           : Bool?              = nil
  var isUseInsurance          : Bool?              = nil
  var adminFee                : Int?               = nil
  var insurancePrice          : Int?               = nil
  var insuranceFee            : Int?               = nil
  var insurancePricePPN       : Int?               = nil
  var codFee                  : Int?               = nil
  var codFeePPN               : Int?               = nil
  var codPrice                : Int?               = nil
  var codValue                : Int?               = nil
  var cashback                : Int?               = nil
  var discount                : Int?               = nil
  var shipmentPrice           : Int?               = nil
  var packagePrice            : Int?               = nil
  var qty                     : Int?               = nil
  var returnFee               : Int?               = nil
  var returnFeePPN            : Int?               = nil
  var returnDiscount          : Int?               = nil
  var height                  : Int?               = nil
  var length                  : Int?               = nil
  var weight                  : Int?               = nil
  var width                   : Int?               = nil
  var packageDesc             : String?            = nil
  var packageTypeId           : Int?               = nil
  var logisticName            : String?            = nil
  var logisticRate            : String?            = nil
  var rateName                : String?            = nil
  var rateCode                : String?            = nil
  var logisticLogoUrl         : String?            = nil
  var durationType            : String?            = nil
  var maxDuration             : Int?               = nil
  var minDuration             : Int?               = nil
  var pickupTime              : Int?               = nil
  var shipmentType            : String?            = nil
  var shippingNote            : String?            = nil
  var isOriginJava            : Bool?              = nil
  var isDestinationJava       : Bool?              = nil
  var isJava                  : Bool?              = nil
  var logisticFee             : Int?               = nil
  var logisticFeePPN          : Int?               = nil
  var logisticFeePPH          : Int?               = nil
  var logisticFeeInsurance    : Int?               = nil
  var logisticFeeInsurancePPN : Int?               = nil
  var logisticFeeDiscount     : Int?               = nil
  var logisticCodFee          : Int?               = nil
  var logisticCodFeePPN       : Int?               = nil
  var logisticCodFeePPH       : Int?               = nil
  var logisticReturnFee       : Int?               = nil
  var logisticReturnFeePPN    : Int?               = nil
  var logisticReturnDiscount  : Int?               = nil
  var addressSnapshot         : [AddressSnapshot]? = []

  enum CodingKeys: String, CodingKey {

    case id                      = "id"
    case orderId                 = "orderId"
    case clientOrderNo           = "clientOrderNo"
    case shipmentOrderNo         = "shipmentOrderNo"
    case signature               = "signature"
    case isCod                   = "isCod"
    case isSelfCourier           = "isSelfCourier"
    case isUseInsurance          = "isUseInsurance"
    case adminFee                = "adminFee"
    case insurancePrice          = "insurancePrice"
    case insuranceFee            = "insuranceFee"
    case insurancePricePPN       = "insurancePricePPN"
    case codFee                  = "codFee"
    case codFeePPN               = "codFeePPN"
    case codPrice                = "codPrice"
    case codValue                = "codValue"
    case cashback                = "cashback"
    case discount                = "discount"
    case shipmentPrice           = "shipmentPrice"
    case packagePrice            = "packagePrice"
    case qty                     = "qty"
    case returnFee               = "returnFee"
    case returnFeePPN            = "returnFeePPN"
    case returnDiscount          = "returnDiscount"
    case height                  = "height"
    case length                  = "length"
    case weight                  = "weight"
    case width                   = "width"
    case packageDesc             = "packageDesc"
    case packageTypeId           = "packageTypeId"
    case logisticName            = "logisticName"
    case logisticRate            = "logisticRate"
    case rateName                = "rateName"
    case rateCode                = "rateCode"
    case logisticLogoUrl         = "logisticLogoUrl"
    case durationType            = "durationType"
    case maxDuration             = "maxDuration"
    case minDuration             = "minDuration"
    case pickupTime              = "pickupTime"
    case shipmentType            = "shipmentType"
    case shippingNote            = "shippingNote"
    case isOriginJava            = "isOriginJava"
    case isDestinationJava       = "isDestinationJava"
    case isJava                  = "isJava"
    case logisticFee             = "logisticFee"
    case logisticFeePPN          = "logisticFeePPN"
    case logisticFeePPH          = "logisticFeePPH"
    case logisticFeeInsurance    = "logisticFeeInsurance"
    case logisticFeeInsurancePPN = "logisticFeeInsurancePPN"
    case logisticFeeDiscount     = "logisticFeeDiscount"
    case logisticCodFee          = "logisticCodFee"
    case logisticCodFeePPN       = "logisticCodFeePPN"
    case logisticCodFeePPH       = "logisticCodFeePPH"
    case logisticReturnFee       = "logisticReturnFee"
    case logisticReturnFeePPN    = "logisticReturnFeePPN"
    case logisticReturnDiscount  = "logisticReturnDiscount"
    case addressSnapshot         = "addressSnapshot"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id                      = try values.decodeIfPresent(String.self            , forKey: .id                      )
    orderId                 = try values.decodeIfPresent(String.self            , forKey: .orderId                 )
    clientOrderNo           = try values.decodeIfPresent(String.self            , forKey: .clientOrderNo           )
    shipmentOrderNo         = try values.decodeIfPresent(String.self            , forKey: .shipmentOrderNo         )
    signature               = try values.decodeIfPresent(String.self            , forKey: .signature               )
    isCod                   = try values.decodeIfPresent(Bool.self              , forKey: .isCod                   )
    isSelfCourier           = try values.decodeIfPresent(Bool.self              , forKey: .isSelfCourier           )
    isUseInsurance          = try values.decodeIfPresent(Bool.self              , forKey: .isUseInsurance          )
    adminFee                = try values.decodeIfPresent(Int.self               , forKey: .adminFee                )
    insurancePrice          = try values.decodeIfPresent(Int.self               , forKey: .insurancePrice          )
    insuranceFee            = try values.decodeIfPresent(Int.self               , forKey: .insuranceFee            )
    insurancePricePPN       = try values.decodeIfPresent(Int.self               , forKey: .insurancePricePPN       )
    codFee                  = try values.decodeIfPresent(Int.self               , forKey: .codFee                  )
    codFeePPN               = try values.decodeIfPresent(Int.self               , forKey: .codFeePPN               )
    codPrice                = try values.decodeIfPresent(Int.self               , forKey: .codPrice                )
    codValue                = try values.decodeIfPresent(Int.self               , forKey: .codValue                )
    cashback                = try values.decodeIfPresent(Int.self               , forKey: .cashback                )
    discount                = try values.decodeIfPresent(Int.self               , forKey: .discount                )
    shipmentPrice           = try values.decodeIfPresent(Int.self               , forKey: .shipmentPrice           )
    packagePrice            = try values.decodeIfPresent(Int.self               , forKey: .packagePrice            )
    qty                     = try values.decodeIfPresent(Int.self               , forKey: .qty                     )
    returnFee               = try values.decodeIfPresent(Int.self               , forKey: .returnFee               )
    returnFeePPN            = try values.decodeIfPresent(Int.self               , forKey: .returnFeePPN            )
    returnDiscount          = try values.decodeIfPresent(Int.self               , forKey: .returnDiscount          )
    height                  = try values.decodeIfPresent(Int.self               , forKey: .height                  )
    length                  = try values.decodeIfPresent(Int.self               , forKey: .length                  )
    weight                  = try values.decodeIfPresent(Int.self               , forKey: .weight                  )
    width                   = try values.decodeIfPresent(Int.self               , forKey: .width                   )
    packageDesc             = try values.decodeIfPresent(String.self            , forKey: .packageDesc             )
    packageTypeId           = try values.decodeIfPresent(Int.self               , forKey: .packageTypeId           )
    logisticName            = try values.decodeIfPresent(String.self            , forKey: .logisticName            )
    logisticRate            = try values.decodeIfPresent(String.self            , forKey: .logisticRate            )
    rateName                = try values.decodeIfPresent(String.self            , forKey: .rateName                )
    rateCode                = try values.decodeIfPresent(String.self            , forKey: .rateCode                )
    logisticLogoUrl         = try values.decodeIfPresent(String.self            , forKey: .logisticLogoUrl         )
    durationType            = try values.decodeIfPresent(String.self            , forKey: .durationType            )
    maxDuration             = try values.decodeIfPresent(Int.self               , forKey: .maxDuration             )
    minDuration             = try values.decodeIfPresent(Int.self               , forKey: .minDuration             )
    pickupTime              = try values.decodeIfPresent(Int.self               , forKey: .pickupTime              )
    shipmentType            = try values.decodeIfPresent(String.self            , forKey: .shipmentType            )
    shippingNote            = try values.decodeIfPresent(String.self            , forKey: .shippingNote            )
    isOriginJava            = try values.decodeIfPresent(Bool.self              , forKey: .isOriginJava            )
    isDestinationJava       = try values.decodeIfPresent(Bool.self              , forKey: .isDestinationJava       )
    isJava                  = try values.decodeIfPresent(Bool.self              , forKey: .isJava                  )
    logisticFee             = try values.decodeIfPresent(Int.self               , forKey: .logisticFee             )
    logisticFeePPN          = try values.decodeIfPresent(Int.self               , forKey: .logisticFeePPN          )
    logisticFeePPH          = try values.decodeIfPresent(Int.self               , forKey: .logisticFeePPH          )
    logisticFeeInsurance    = try values.decodeIfPresent(Int.self               , forKey: .logisticFeeInsurance    )
    logisticFeeInsurancePPN = try values.decodeIfPresent(Int.self               , forKey: .logisticFeeInsurancePPN )
    logisticFeeDiscount     = try values.decodeIfPresent(Int.self               , forKey: .logisticFeeDiscount     )
    logisticCodFee          = try values.decodeIfPresent(Int.self               , forKey: .logisticCodFee          )
    logisticCodFeePPN       = try values.decodeIfPresent(Int.self               , forKey: .logisticCodFeePPN       )
    logisticCodFeePPH       = try values.decodeIfPresent(Int.self               , forKey: .logisticCodFeePPH       )
    logisticReturnFee       = try values.decodeIfPresent(Int.self               , forKey: .logisticReturnFee       )
    logisticReturnFeePPN    = try values.decodeIfPresent(Int.self               , forKey: .logisticReturnFeePPN    )
    logisticReturnDiscount  = try values.decodeIfPresent(Int.self               , forKey: .logisticReturnDiscount  )
    addressSnapshot         = try values.decodeIfPresent([AddressSnapshot].self , forKey: .addressSnapshot         )
 
  }

  init() {

  }

}
