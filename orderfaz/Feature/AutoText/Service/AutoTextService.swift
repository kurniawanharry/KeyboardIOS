//
//  AutoTextService.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation

class AutoTextService : ApiBase {
    
    func fetch(search:String,completion: @escaping (Result<[AutoTexts], Error>) -> Void) async throws  {
        guard let url  = URL(string: "\(Env.autoTextUrl)/user") else {
            return
        }
        
        let baseUrl =  url.appending(queryItems: [
         URLQueryItem(name: "search", value: search),
         ])

        let request = getData(url: baseUrl, T: "")

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return completion(.failure(NetworkError.badeUrl))
            }

            do {
                let response = try JSONDecoder().decode(BaseResponse<AutoTextResponse>.self, from: data)

                print("SUCCSESS \(String(describing: response))")
                if(response.statusCode == 200){
                    DispatchQueue.main.async {
                        completion(.success(response.data?.autoTexts ?? []))
                    }

                }
            } catch {
                completion(.failure(NetworkError.invalidResponse))
            }
        }
        task.resume()
    }
}
