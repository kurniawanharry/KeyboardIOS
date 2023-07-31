//
//  ProductCardView.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation
import SwiftUI

struct ProductCardView: View {
    let name:String
    let price:String
    let weight:Int
    let image:String
    let imageSize:CGFloat = 50
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 5,style: .continuous).fill(.white).shadow(radius: 1)
            
            HStack {
                ImageUrl(url: image) {image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(5)
                        .clipped()
                }.frame(width: imageSize, height:imageSize)
                VStack(alignment: HorizontalAlignment.leading,spacing: 5) {
                    HStack(alignment: .top,spacing:8) {
                        Image(systemName: "bag")
                        Text(name)
                       
                        if(weight != 0){
                            let price = NSDecimalNumber(value: weight).dividing(by: 1000)
                            Text("\(price) Kg").font(.system(size: 10)).foregroundColor(.gray)
                        }
                    }.font(.system(size: 12))
                    HStack(spacing:8) {
                        Image(systemName: "cart")
                        Text("Rp \(price)")
                    }.font(.system(size: 12))
                   
                }
                Spacer(minLength: 5)
                Image(systemName: "square.and.arrow.up").padding(.trailing, 20)
                    .font(.system(size: 16))
            }
            .padding(5)

        }
        .padding(5)
        .onTapGesture {
               print(name)
            }
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(name: "",price: "0",weight: 0, image: "")
    }
}
