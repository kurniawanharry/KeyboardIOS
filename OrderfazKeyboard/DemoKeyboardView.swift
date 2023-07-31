//
//  DemoKeyboardView.swift
//  KeyboardCustom
//
//  Created by Daniel Saidi on 2022-02-04.
//  Copyright © 2022-2023 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This view adds a `SystemKeyboard` with some more views to a
 `VStack`, then configures the keyboard slightly.
 
 The system keyboard will then adapt its appearance based on
 the ``DemoKeyboardAppearance``, its input keys based on the
 ``DemoInputSetProvider`` and its full keyboard layout based
 on the ``DemoLayoutProvider``.
 */
struct DemoKeyboardView: View {
    
    unowned var controller: KeyboardInputViewController
    
    @State
    private var autoText:Bool = false
    
    @EnvironmentObject
    private var keyboardContext: KeyboardContext
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment:.top,spacing: 0){
                
                Image("logo")
                    .resizable().scaledToFit()
                    .frame(width: 40,height: 40)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack (spacing: 5){
                        Button {
                            print("Auto Text")
                            autoText.toggle()
                        } label: {
                            Label("Auto Text", systemImage: "doc.plaintext.fill")
                        } .buttonStyle(BigButtonStyle())
                        
                        Button {
                            print("Produk")
                        } label: {
                            Label("Produk", systemImage: "shippingbox.fill")
                        } .buttonStyle(BigButtonStyle())
                        
                        Button {
                            print("Cek Ongkir")
                        } label: {
                            Label("Cek Ongkir", systemImage: "box.truck.fill")
                        }  .buttonStyle(BigButtonStyle())
                        
                        Button {
                            print("Order")
                        } label: {
                            Label("Order", systemImage: "doc.fill")
                        }  .buttonStyle(BigButtonStyle())
                        
                        Button {
                            print("Invoice")
                        } label: {
                            Label("Invoice", systemImage: "doc.fill.badge.plus")
                        }  .buttonStyle(BigButtonStyle())
                    }.padding(.leading, 5)
                }
            }.padding(EdgeInsets(top: 10, leading: 5, bottom: 5, trailing: 5)).background(Color(0xE5E5E5))
            if autoText {
                AutoTextScreen(controller: controller)
            } else {
                
                SystemKeyboard(
                    controller: controller,
                    autocompleteToolbar: .none
                )
            }
            
        }.background(Color(0xE5E5E5))
    }
}
