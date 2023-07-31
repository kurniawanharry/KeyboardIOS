//
//  Product.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation

struct Products: Codable {

  var id                     : String?           = nil
  var productName            : String?           = nil
  var productDescription     : String?           = nil
  var slug                   : String?           = nil
  var productStatusId        : Int?              = nil
  var productStatus          : String?           = nil
  var productTypeId          : Int?              = nil
  var productType            : String?           = nil
  var productCategoryId      : Int?              = nil
  var productCategory        : String?           = nil
  var productCategorySlug    : String?           = nil
  var productImage           : [String]?         = []
  var productVideo           : String?           = nil
  var productBrandName       : String?           = nil
  var productBrandLogo       : String?           = nil
  var productPriceUnit       : Int?              = nil
  var productPriceDiscounted : Int?           = nil
//  var productPriceWholesale  : Int?           = nil
  var productPriceCogs       : Int?           = nil
  var productDiscountStart   : String?           = nil
  var productDiscountEnd     : String?           = nil
  var productVariant         : [ProductVariant]? = []
  var productBump            : ProductBump?      = ProductBump()
  var isFavorite             : Bool?             = nil
  var isHide                 : Bool?             = nil
  var checkoutCount          : Int?              = nil
  var checkoutUrl            : String?           = nil
  var checkoutSettingId      : String?           = nil
  var csSettingId            : String?           = nil
  var externalData           : ExternalData?     = ExternalData()
  var createdAt              : String?           = nil
  var createdBy              : String?           = nil

  enum CodingKeys: String, CodingKey {

    case id                     = "id"
    case productName            = "productName"
    case productDescription     = "productDescription"
    case slug                   = "slug"
    case productStatusId        = "productStatusId"
    case productStatus          = "productStatus"
    case productTypeId          = "productTypeId"
    case productType            = "productType"
    case productCategoryId      = "productCategoryId"
    case productCategory        = "productCategory"
    case productCategorySlug    = "productCategorySlug"
    case productImage           = "productImage"
    case productVideo           = "productVideo"
    case productBrandName       = "productBrandName"
    case productBrandLogo       = "productBrandLogo"
    case productPriceUnit       = "productPriceUnit"
    case productPriceDiscounted = "productPriceDiscounted"
//    case productPriceWholesale  = "productPriceWholesale"
    case productPriceCogs       = "productPriceCogs"
    case productDiscountStart   = "productDiscountStart"
    case productDiscountEnd     = "productDiscountEnd"
    case productVariant         = "productVariant"
    case productBump            = "productBump"
    case isFavorite             = "isFavorite"
    case isHide                 = "isHide"
    case checkoutCount          = "checkoutCount"
    case checkoutUrl            = "checkoutUrl"
    case checkoutSettingId      = "checkoutSettingId"
    case csSettingId            = "csSettingId"
    case externalData           = "externalData"
    case createdAt              = "createdAt"
    case createdBy              = "createdBy"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id                     = try values.decodeIfPresent(String.self           , forKey: .id                     )
    productName            = try values.decodeIfPresent(String.self           , forKey: .productName            )
    productDescription     = try values.decodeIfPresent(String.self           , forKey: .productDescription     )
    slug                   = try values.decodeIfPresent(String.self           , forKey: .slug                   )
    productStatusId        = try values.decodeIfPresent(Int.self              , forKey: .productStatusId        )
    productStatus          = try values.decodeIfPresent(String.self           , forKey: .productStatus          )
    productTypeId          = try values.decodeIfPresent(Int.self              , forKey: .productTypeId          )
    productType            = try values.decodeIfPresent(String.self           , forKey: .productType            )
    productCategoryId      = try values.decodeIfPresent(Int.self              , forKey: .productCategoryId      )
    productCategory        = try values.decodeIfPresent(String.self           , forKey: .productCategory        )
    productCategorySlug    = try values.decodeIfPresent(String.self           , forKey: .productCategorySlug    )
    productImage           = try values.decodeIfPresent([String].self         , forKey: .productImage           )
    productVideo           = try values.decodeIfPresent(String.self           , forKey: .productVideo           )
    productBrandName       = try values.decodeIfPresent(String.self           , forKey: .productBrandName       )
    productBrandLogo       = try values.decodeIfPresent(String.self           , forKey: .productBrandLogo       )
    productPriceUnit       = try values.decodeIfPresent(Int.self              , forKey: .productPriceUnit       )
    productPriceDiscounted = try values.decodeIfPresent(Int.self           , forKey: .productPriceDiscounted )
//    productPriceWholesale  = try values.decodeIfPresent(Int.self           , forKey: .productPriceWholesale  )
    productPriceCogs       = try values.decodeIfPresent(Int.self           , forKey: .productPriceCogs       )
    productDiscountStart   = try values.decodeIfPresent(String.self           , forKey: .productDiscountStart   )
    productDiscountEnd     = try values.decodeIfPresent(String.self           , forKey: .productDiscountEnd     )
    productVariant         = try values.decodeIfPresent([ProductVariant].self , forKey: .productVariant         )
    productBump            = try values.decodeIfPresent(ProductBump.self      , forKey: .productBump            )
    isFavorite             = try values.decodeIfPresent(Bool.self             , forKey: .isFavorite             )
    isHide                 = try values.decodeIfPresent(Bool.self             , forKey: .isHide                 )
    checkoutCount          = try values.decodeIfPresent(Int.self              , forKey: .checkoutCount          )
    checkoutUrl            = try values.decodeIfPresent(String.self           , forKey: .checkoutUrl            )
    checkoutSettingId      = try values.decodeIfPresent(String.self           , forKey: .checkoutSettingId      )
    csSettingId            = try values.decodeIfPresent(String.self           , forKey: .csSettingId            )
    externalData           = try values.decodeIfPresent(ExternalData.self     , forKey: .externalData           )
    createdAt              = try values.decodeIfPresent(String.self           , forKey: .createdAt              )
    createdBy              = try values.decodeIfPresent(String.self           , forKey: .createdBy              )
 
  }

  init() {

  }

}
