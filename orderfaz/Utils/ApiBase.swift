//
//  ApiBase.swift
//  orderfaz
//
//  Created by User on 31/07/23.
//

import Foundation


class ApiBase {
    
    func post(url:URL, T:Codable) throws -> URLRequest  {
        var request = URLRequest(url: url)
        
        //        let encoder = JSONEncoder()
        //        encoder.outputFormatting = .prettyPrinted
        
        let body = try JSONEncoder().encode(T)
        
        request.httpMethod = "POST"
        request.httpBody = body
        request.header()
        
        return request
    }
    
    func getData(url:URL, T:Codable) -> URLRequest {
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.header()
        
        return request
    }
}
