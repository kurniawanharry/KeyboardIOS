//
//  RateRequest.swift
//  orderfaz
//
//  Created by User on 25/07/23.
//

import Foundation

struct RateRequest: Codable {

  var destinationLatitude        : Int?    = nil
  var destinationLongitude       : Int?    = nil
  var destinationPostalCode      : String? = nil
  var destinationSubDistrictName : String? = nil
  var height                     : Int?    = nil
  var isCod                      : Bool?   = nil
  var isUseInsurance             : Bool?   = nil
  var itemPrice                  : Int?    = nil
  var length                     : Int?    = nil
  var originLatitude             : Int?    = nil
  var originLongitude            : Int?    = nil
  var originPostalCode           : String? = nil
  var originSubDistrictName      : String? = nil
  var packageTypeId              : Int?    = nil
  var shipmentType               : String? = nil
  var weight                     : Int?    = nil
  var width                      : Int?    = nil
}
