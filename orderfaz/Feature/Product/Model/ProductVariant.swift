//
//  ProductVariant.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation

struct ProductVariant: Codable {

  var qty                  : Int?    = nil
  var variantRealPrice     : Int?    = nil
  var variantRealPriceType : String? = nil
  var id                   : String? = nil
  var variantName          : String? = nil
  var variantSKU           : String? = nil
  var variantStock         : Int? = nil
  var variantPrice         : Int?    = nil
  var variantDiscount      : Int? = nil
  var variantCOGS          : Int? = nil
  var variantWeight        : Int?    = nil
  var variantHeight        : Int? = nil
  var variantWidth         : Int? = nil
  var variantLength        : Int? = nil
  var variantDesc          : String? = nil
  var variantCategory : [VariantCategory]? = []
  var variantIsActive      : Bool?   = nil
  var variantIsMain        : Bool?   = nil
  var variantImages   : String?            = nil

  enum CodingKeys: String, CodingKey {

    case qty                  = "qty"
    case variantRealPrice     = "variantRealPrice"
    case variantRealPriceType = "variantRealPriceType"
    case id                   = "id"
    case variantName          = "variantName"
    case variantSKU           = "variantSKU"
    case variantStock         = "variantStock"
    case variantPrice         = "variantPrice"
    case variantDiscount      = "variantDiscount"
    case variantCOGS          = "variantCOGS"
    case variantWeight        = "variantWeight"
    case variantHeight        = "variantHeight"
    case variantWidth         = "variantWidth"
    case variantLength        = "variantLength"
    case variantDesc          = "variantDesc"
    case variantCategory      = "variantCategory"
    case variantIsActive      = "variantIsActive"
    case variantIsMain        = "variantIsMain"
    case variantImages   = "variantImages"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    qty                  = try values.decodeIfPresent(Int.self    , forKey: .qty                  )
    variantRealPrice     = try values.decodeIfPresent(Int.self    , forKey: .variantRealPrice     )
    variantRealPriceType = try values.decodeIfPresent(String.self , forKey: .variantRealPriceType )
    id                   = try values.decodeIfPresent(String.self , forKey: .id                   )
    variantName          = try values.decodeIfPresent(String.self , forKey: .variantName          )
    variantSKU           = try values.decodeIfPresent(String.self , forKey: .variantSKU           )
    variantStock         = try values.decodeIfPresent(Int.self , forKey: .variantStock         )
    variantPrice         = try values.decodeIfPresent(Int.self    , forKey: .variantPrice         )
    variantDiscount      = try values.decodeIfPresent(Int.self , forKey: .variantDiscount      )
    variantCOGS          = try values.decodeIfPresent(Int.self , forKey: .variantCOGS          )
    variantWeight        = try values.decodeIfPresent(Int.self    , forKey: .variantWeight        )
    variantHeight        = try values.decodeIfPresent(Int.self , forKey: .variantHeight        )
    variantWidth         = try values.decodeIfPresent(Int.self , forKey: .variantWidth         )
    variantLength        = try values.decodeIfPresent(Int.self , forKey: .variantLength        )
    variantDesc          = try values.decodeIfPresent(String.self , forKey: .variantDesc          )
    variantCategory = try values.decodeIfPresent([VariantCategory].self , forKey: .variantCategory )
    variantIsActive      = try values.decodeIfPresent(Bool.self   , forKey: .variantIsActive      )
    variantIsMain        = try values.decodeIfPresent(Bool.self   , forKey: .variantIsMain        )
    variantImages   = try values.decodeIfPresent(String.self            , forKey: .variantImages   )
 
  }

  init() {

  }

}
