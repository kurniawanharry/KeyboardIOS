//
//  ImageCache.swift
//  orderfaz
//
//  Created by User on 28/07/23.
//

import Foundation
import SwiftUI

struct ImageUrl<Content: View>: View {

    var url: String
    
    @State private var image: UIImage?
    @State private var errors: String?

    @ViewBuilder var content: (Image) -> Content
    
    init(url: String, @ViewBuilder content: @escaping (Image) -> Content) {
        self.url = url
        self.content = content
    }
    

    var body: some View {
        VStack {
            if let image = image {
                content(Image(uiImage: image))
            } else {
                ProgressView().onAppear { loadImage() }
            }
        }
    }
    
    private func loadImage() {
        guard let url = URL(string: url) else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest),
           let image = UIImage(data: cachedResponse.data) {
            self.image = image
        } else {
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let data = data, let response = response, let image = UIImage(data: data) {
                    let cachedResponse = CachedURLResponse(response: response, data: data)
                    URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }.resume()
        }
    }
}
