//
//  AddressSnapshot.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation

struct AddressSnapshot: Codable {

  var address     : String?    = nil
  var contactName : String?    = nil
  var createdAt   : CreatedAt? = CreatedAt()
  var createdBy   : String?    = nil
  var id          : String?    = nil
  var isDefault   : Bool?      = nil
  var latitude    : Double?    = nil
  var longitude   : Double?    = nil
  var city        : String?    = nil
  var district    : String?    = nil
  var province    : String?    = nil
  var name        : String?    = nil
  var notes       : String?    = nil
  var subDistrict : String?    = nil
  var typeId      : Int?       = nil
  var userMsisdn  : String?    = nil
  var email       : String?    = nil
  var postalCode  : String?    = nil

  enum CodingKeys: String, CodingKey {

    case address     = "address"
    case contactName = "contactName"
    case createdAt   = "createdAt"
    case createdBy   = "createdBy"
    case id          = "id"
    case isDefault   = "isDefault"
    case latitude    = "latitude"
    case longitude   = "longitude"
    case city        = "city"
    case district    = "district"
    case province    = "province"
    case name        = "name"
    case notes       = "notes"
    case subDistrict = "subDistrict"
    case typeId      = "typeId"
    case userMsisdn  = "userMsisdn"
    case email       = "email"
    case postalCode  = "postalCode"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    address     = try values.decodeIfPresent(String.self    , forKey: .address     )
    contactName = try values.decodeIfPresent(String.self    , forKey: .contactName )
    createdAt   = try values.decodeIfPresent(CreatedAt.self , forKey: .createdAt   )
    createdBy   = try values.decodeIfPresent(String.self    , forKey: .createdBy   )
    id          = try values.decodeIfPresent(String.self    , forKey: .id          )
    isDefault   = try values.decodeIfPresent(Bool.self      , forKey: .isDefault   )
    latitude    = try values.decodeIfPresent(Double.self    , forKey: .latitude    )
    longitude   = try values.decodeIfPresent(Double.self    , forKey: .longitude   )
    city        = try values.decodeIfPresent(String.self    , forKey: .city        )
    district    = try values.decodeIfPresent(String.self    , forKey: .district    )
    province    = try values.decodeIfPresent(String.self    , forKey: .province    )
    name        = try values.decodeIfPresent(String.self    , forKey: .name        )
    notes       = try values.decodeIfPresent(String.self    , forKey: .notes       )
    subDistrict = try values.decodeIfPresent(String.self    , forKey: .subDistrict )
    typeId      = try values.decodeIfPresent(Int.self       , forKey: .typeId      )
    userMsisdn  = try values.decodeIfPresent(String.self    , forKey: .userMsisdn  )
    email       = try values.decodeIfPresent(String.self    , forKey: .email       )
    postalCode  = try values.decodeIfPresent(String.self    , forKey: .postalCode  )
 
  }

  init() {

  }

}
