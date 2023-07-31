//
//  Orders.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation

struct Orders: Codable {

  var id                               : String?           = nil
  var orderType                        : Int?              = nil
  var orderId                          : String?           = nil
  var orderStatusId                    : Int?              = nil
  var isDraftReady                     : Bool?             = nil
  var paymentStatusId                  : Int?              = nil
  var paymentDetails                   : [PaymentDetails]? = []
  var expiryDate                       : Int?              = nil
  var paymentMethod                    : String?           = nil
  var transactionValue                 : Int?              = nil
  var createdAt                        : String?           = nil
  var createdBy                        : String?           = nil
  var paidAt                           : String?           = nil
  var orderValue                       : Int?              = nil
  var orderDetails                     : OrderDetails?     = OrderDetails()
  var orderTags                        : String?           = nil
  var orderFollowUpTextWelcomeIsUse    : Bool?             = nil
  var orderFollowUpTextFollowUp1IsUse  : Bool?             = nil
  var orderFollowUpTextFollowUp2IsUse  : Bool?             = nil
  var orderFollowUpTextFollowUp3IsUse  : Bool?             = nil
  var orderFollowUpTextFollowUp4IsUse  : Bool?             = nil
  var orderFollowUpTextProcessingIsUse : Bool?             = nil
  var orderFollowUpTextCompletedIsUse  : Bool?             = nil
  var orderFollowUpTextUpSellingIsUse  : Bool?             = nil
  var orderFollowUpTextRedirectIsUse   : Bool?             = nil
  var manualOrderStatus                : Int?           = nil
  var manualPaymentStatus              : Int?           = nil
  var isManual                         : Bool?             = nil
  var handledBy                        : String?           = nil
  var paymentFeeBuyer                  : Bool?             = nil

  enum CodingKeys: String, CodingKey {

    case id                               = "id"
    case orderType                        = "orderType"
    case orderId                          = "orderId"
    case orderStatusId                    = "orderStatusId"
    case isDraftReady                     = "isDraftReady"
    case paymentStatusId                  = "paymentStatusId"
    case paymentDetails                   = "paymentDetails"
    case expiryDate                       = "expiryDate"
    case paymentMethod                    = "paymentMethod"
    case transactionValue                 = "transactionValue"
    case createdAt                        = "createdAt"
    case createdBy                        = "createdBy"
    case paidAt                           = "paidAt"
    case orderValue                       = "orderValue"
    case orderDetails                     = "orderDetails"
    case orderTags                        = "orderTags"
    case orderFollowUpTextWelcomeIsUse    = "orderFollowUpTextWelcomeIsUse"
    case orderFollowUpTextFollowUp1IsUse  = "orderFollowUpTextFollowUp1IsUse"
    case orderFollowUpTextFollowUp2IsUse  = "orderFollowUpTextFollowUp2IsUse"
    case orderFollowUpTextFollowUp3IsUse  = "orderFollowUpTextFollowUp3IsUse"
    case orderFollowUpTextFollowUp4IsUse  = "orderFollowUpTextFollowUp4IsUse"
    case orderFollowUpTextProcessingIsUse = "orderFollowUpTextProcessingIsUse"
    case orderFollowUpTextCompletedIsUse  = "orderFollowUpTextCompletedIsUse"
    case orderFollowUpTextUpSellingIsUse  = "orderFollowUpTextUpSellingIsUse"
    case orderFollowUpTextRedirectIsUse   = "orderFollowUpTextRedirectIsUse"
    case manualOrderStatus                = "manualOrderStatus"
    case manualPaymentStatus              = "manualPaymentStatus"
    case isManual                         = "isManual"
    case handledBy                        = "handledBy"
    case paymentFeeBuyer                  = "paymentFeeBuyer"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id                               = try values.decodeIfPresent(String.self           , forKey: .id                               )
    orderType                        = try values.decodeIfPresent(Int.self              , forKey: .orderType                        )
    orderId                          = try values.decodeIfPresent(String.self           , forKey: .orderId                          )
    orderStatusId                    = try values.decodeIfPresent(Int.self              , forKey: .orderStatusId                    )
    isDraftReady                     = try values.decodeIfPresent(Bool.self             , forKey: .isDraftReady                     )
    paymentStatusId                  = try values.decodeIfPresent(Int.self              , forKey: .paymentStatusId                  )
    paymentDetails                   = try values.decodeIfPresent([PaymentDetails].self , forKey: .paymentDetails                   )
    expiryDate                       = try values.decodeIfPresent(Int.self              , forKey: .expiryDate                       )
    paymentMethod                    = try values.decodeIfPresent(String.self           , forKey: .paymentMethod                    )
    transactionValue                 = try values.decodeIfPresent(Int.self              , forKey: .transactionValue                 )
    createdAt                        = try values.decodeIfPresent(String.self           , forKey: .createdAt                        )
    createdBy                        = try values.decodeIfPresent(String.self           , forKey: .createdBy                        )
    paidAt                           = try values.decodeIfPresent(String.self           , forKey: .paidAt                           )
    orderValue                       = try values.decodeIfPresent(Int.self              , forKey: .orderValue                       )
    orderDetails                     = try values.decodeIfPresent(OrderDetails.self     , forKey: .orderDetails                     )
    orderTags                        = try values.decodeIfPresent(String.self           , forKey: .orderTags                        )
    orderFollowUpTextWelcomeIsUse    = try values.decodeIfPresent(Bool.self             , forKey: .orderFollowUpTextWelcomeIsUse    )
    orderFollowUpTextFollowUp1IsUse  = try values.decodeIfPresent(Bool.self             , forKey: .orderFollowUpTextFollowUp1IsUse  )
    orderFollowUpTextFollowUp2IsUse  = try values.decodeIfPresent(Bool.self             , forKey: .orderFollowUpTextFollowUp2IsUse  )
    orderFollowUpTextFollowUp3IsUse  = try values.decodeIfPresent(Bool.self             , forKey: .orderFollowUpTextFollowUp3IsUse  )
    orderFollowUpTextFollowUp4IsUse  = try values.decodeIfPresent(Bool.self             , forKey: .orderFollowUpTextFollowUp4IsUse  )
    orderFollowUpTextProcessingIsUse = try values.decodeIfPresent(Bool.self             , forKey: .orderFollowUpTextProcessingIsUse )
    orderFollowUpTextCompletedIsUse  = try values.decodeIfPresent(Bool.self             , forKey: .orderFollowUpTextCompletedIsUse  )
    orderFollowUpTextUpSellingIsUse  = try values.decodeIfPresent(Bool.self             , forKey: .orderFollowUpTextUpSellingIsUse  )
    orderFollowUpTextRedirectIsUse   = try values.decodeIfPresent(Bool.self             , forKey: .orderFollowUpTextRedirectIsUse   )
    manualOrderStatus                = try values.decodeIfPresent(Int.self           , forKey: .manualOrderStatus                )
    manualPaymentStatus              = try values.decodeIfPresent(Int.self           , forKey: .manualPaymentStatus              )
    isManual                         = try values.decodeIfPresent(Bool.self             , forKey: .isManual                         )
    handledBy                        = try values.decodeIfPresent(String.self           , forKey: .handledBy                        )
    paymentFeeBuyer                  = try values.decodeIfPresent(Bool.self             , forKey: .paymentFeeBuyer                  )
 
  }

  init() {

  }

}
