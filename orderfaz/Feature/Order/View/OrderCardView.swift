//
//  OrderCardView.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation
import SwiftUI

struct OrderCardView: View {
    let orderId:String
    let status:Int
    let createdAt:String
    let userName:String
    let price:Int
    let products:[Products]
    let shipment:ShipmentSnapshot
    let imageSize:CGFloat = 40
    let onTap:()->Void
    
    var productName:String {
        var name = ""
        if(!products.isEmpty){
            if(products.count > 1){
                name = "\(products.first?.productName ?? "") and more"
            } else {
                name =  products.first?.productName ?? ""
            }
        }
        return name
    }
    
    var name: String {
        var name = ""
        if(userName.isEmpty){
            name = shipment.addressSnapshot?.first?.contactName ?? ""
        } else {
            name = userName
        }
        return name
    }

    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 5,style: .continuous).fill(.white).shadow(radius: 1)
            
            VStack(alignment: HorizontalAlignment.leading) {
                Text(orderId).font(.system(size: 14)).bold()
                Text("\(displayDate(date: createdAt))").font(.system(size: 10)).foregroundColor(.gray)
                
                Divider().padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 5))
                
                Text("\(orderStatus(status: status))").font(.system(size: 14)).foregroundColor(.blue).bold()
                
                HStack {
                    ImageUrl(url: shipment.logisticLogoUrl ?? "") {image in
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(5)
                            .clipped()
                    }.frame(width: imageSize, height:imageSize)

                    Spacer()
                            .frame(width: 10)
                    VStack(alignment: HorizontalAlignment.leading,spacing: 5) {
                        HStack(spacing:8) {
                            Image(systemName: "person").frame(width: 10,height: 10)
                            Text(name)
                        }.font(.system(size: 12))
                        HStack(spacing:8) {
                            Image(systemName: "bag").frame(width: 10,height: 10)
                            Text(productName)
                        }.font(.system(size: 12))
                    }
                }
                
                HStack {
                    VStack(alignment: HorizontalAlignment.leading,spacing: 5) {
                        HStack(spacing:8) {
                            Text("Total Harga").font(.system(size: 10)).foregroundColor(.gray)
                        }.font(.system(size: 12))
                        HStack(spacing:8) {
                            Text("Rp \(price)")
                        }.font(.system(size: 12))
                    }
                    Spacer(minLength: 5)
                    Button {
                        onTap()
                    } label: {
                        Label("Ingatkan Pelanggan", systemImage: "bell")
                    }  .buttonStyle(NotifButton())
                }
            }
            .padding(10)
        }
        .padding(5)
    }
}

struct OrderCardView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCardView(
            orderId: "",
            status: 0,
            createdAt: "",
            userName: "",
            price: 0,
            products: [],
            shipment: ShipmentSnapshot(),
            onTap: {}
        )
    }
}
