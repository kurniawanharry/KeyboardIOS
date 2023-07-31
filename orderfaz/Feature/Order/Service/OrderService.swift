//
//  OrderService.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation

class OrderService : ApiBase {
    
    func fetch(
        search:String,
        offset:Int = 0,
        limit:Int = 10,
        completion: @escaping (Result<OrderResponse, Error>) -> Void
    ) async throws {
        guard let url  = URL(string: "\(Env.orderUrl)/order") else {
            return completion(.failure(NetworkError.badeUrl))
        }
        
        let baseUrl =  url.appending(queryItems: [
            URLQueryItem(name: "search", value: search),
            URLQueryItem(name: "offset", value: "\(offset)"),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "order", value: "desc"),
            URLQueryItem(name: "sort", value: "created_at"),
            URLQueryItem(name: "include-order-type", value: "400,300,100"),
            URLQueryItem(name: "exclude-status", value: "701"),
        ])
        
        let request = getData(url: baseUrl, T: "")
        
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return completion(.failure(NetworkError.badId))
            }
            
            do {
                let response = try JSONDecoder().decode(BaseResponse<OrderResponse>.self, from: data)
              
                
                print("SUCCSESS ORDER \(String(describing: response))")
                if(response.statusCode == 200){
                    completion(.success(response.data ?? OrderResponse()))
                }
            } catch {
                completion(.failure(NetworkError.invalidResponse))
            }
        }
        task.resume()
    }
    
    func getTextReminder(
        orderId:String,
        categoryId:Int,
        completion: @escaping (Result<String, Error>) -> Void
    ) async throws {
        guard let url  = URL(string: "\(Env.orderUrl)/notif-wa/\(orderId)") else {
            return completion(.failure(NetworkError.badeUrl))
        }
        
        
        let baseUrl =  url.appending(queryItems: [
            URLQueryItem(name: "categoryId", value: "\(categoryId)"),
        ])
        
        
        let request = getData(url: baseUrl, T: "")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return completion(.failure(NetworkError.badId))
            }
            
            do {
                let response = try JSONDecoder().decode(BaseResponse<NotifTextResponse>.self, from: data)
                print("SUCCSESS GET TEXT \(String(describing: response))")
                
                if response.statusCode == 200 {
                    completion(.success(response.data?.text ?? ""))
                }
                
                } catch {
                    completion(.failure(NetworkError.invalidResponse))
                }
            }
            task.resume()
            
        }
    }
