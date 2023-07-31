//
//  InvoiceService.swift
//  orderfaz
//
//  Created by User on 27/07/23.
//

import Foundation

class InvoiceService : ApiBase {
    func sendInvoice(invoiceReq:RequestOrder, completion: @escaping (Result<Bool, Error>) -> Void) async throws{
        guard let url  = URL(string: "\(Env.orderUrl)/order") else {
            throw NetworkError.badeUrl
        }

        let request = try post(url: url, T: invoiceReq)
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                          httpResponse.statusCode == 201,
                          let data = data,  error == nil else {
                return completion(.failure(NetworkError.badeUrl))}
                            
            do {
                let response = try JSONSerialization.jsonObject(with: data,options: .fragmentsAllowed)
                print("SUCCSESS RATES \(String(describing: response))")
                completion(.success(true))
            } catch {
                completion(.failure(NetworkError.invalidResponse))
            }
     
        })
        task.resume()
    }
}
