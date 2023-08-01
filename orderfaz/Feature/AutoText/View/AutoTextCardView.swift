//
//  AutoTextCardView.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation
import SwiftUI

struct AutoTextCardView: View {
    let name:String
    let content:String
    let isDefault:Bool
    let onTap:(_ content:String)-> Void
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 5,style: .continuous).fill(.white).shadow(radius: 0.5)
            
            VStack(alignment: HorizontalAlignment.leading) {
                Label(name, systemImage: "text.bubble").font(.system(size: 15))
                Spacer(minLength:5)
                Label(content, systemImage: "text.quote").font(.system(size: 15))
            }.padding(5)

        }
        .padding(5)
        .onTapGesture {
            onTap(content)
            }
    }
}

struct AutoTextCardView_Previews: PreviewProvider {
    static var previews: some View {
        AutoTextCardView(name: String(), content: String(),isDefault: true,onTap: {content in })
    }
}
