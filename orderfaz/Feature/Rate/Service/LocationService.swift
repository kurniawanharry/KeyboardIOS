//
//  LocationService.swift
//  orderfaz
//
//  Created by User on 25/07/23.
//

import Foundation

class LocationService : ApiBase {
    func getLocation(search:String) async throws -> [Location] {
        guard let url  = URL(string: "\(Env.shipmentUrl)/public/location") else {
            throw NetworkError.badeUrl
        }
        
        print("Making API Call")
        
       let baseUrl =  url.appending(queryItems: [
        URLQueryItem(name: "search", value: search),
        URLQueryItem(name: "limit", value: "10")
        ])
        
        let request = getData(url: baseUrl, T: "")
        
        let (data, response) = try await URLSession.shared.data(from: request.url!)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badId
        }
        
        let locationResponse = try JSONDecoder().decode(BaseResponse<[Location]>.self, from: data)
        
        return locationResponse.data ?? []
    }
    
    func getRates(rateReq:RateRequest, completion: @escaping (Result<[Rate], Error>) -> Void) async throws{
        guard let url  = URL(string: "\(Env.shipmentUrl)/rates") else {
            throw NetworkError.badeUrl
        }
        
        print("Making API Call")
        
        
        let request = try post(url: url, T: rateReq)
        
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(NetworkError.badId))
            }
                            
            do {
                let response = try JSONDecoder().decode(BaseResponse<[Rate]>.self, from: data)
                print("SUCCSESS RATES \(String(describing: response))")
                if response.statusCode == 200 {
                    completion(.success(response.data!))
                }
              
            } catch {
                completion(.failure(NetworkError.invalidResponse))
            }
     
        })
        task.resume()
    }
}
