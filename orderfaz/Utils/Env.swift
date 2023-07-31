//
//  Env.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation

struct Env {
    static let debugMode:Bool = false
    
    static let devUrl:String = "https://api.bayu.host"
    static let prodUrl:String = "https://api.orderfaz.com"
    
    static let baseUrl:String = debugMode.self ? devUrl : prodUrl
    static let TOKEN = debugMode.self ? Constants.TOKENDEV : Constants.TOKENPROD
    
    static let autoTextUrl = "\(baseUrl)/autotexts/v1"
    static let productUrl = "\(baseUrl)/products/v2"
    static let orderUrl = "\(baseUrl)/orders/v2"
    static let shipmentUrl = "\(baseUrl)/shipments/v2"
   
   
}
