//
//  ProductService.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation

class ProductService : ApiBase {
    
    func fetch(
        search:String,
        offset:Int = 0,
        limit:Int = 10,
        completion: @escaping (Result<ProductResponse, Error>) -> Void
    ) async throws{
        guard let url  = URL(string: "\(Env.productUrl)/products/user") else {
            throw NetworkError.badId
        }
    
        let baseUrl =  url.appending(queryItems: [
         URLQueryItem(name: "search", value: search),
         URLQueryItem(name: "offset", value: "\(offset)"),
         URLQueryItem(name: "limit", value: "\(limit)"),
         ])
        
        let request = getData(url: baseUrl, T: "")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return completion(.failure( NetworkError.badId))
            }
            
            do {
                let response = try JSONDecoder().decode(BaseResponse<ProductResponse>.self, from: data)

                print("SUCCSESS PRODUCT \(String(describing: response))")
                
                if(response.statusCode == 200){
                    completion(.success(response.data ?? ProductResponse()))
                } else {
                    completion(.success(ProductResponse()))
                }
                
            } catch {
                completion(.failure(NetworkError.invalidResponse))
            }
        }
        task.resume()
    }
}
