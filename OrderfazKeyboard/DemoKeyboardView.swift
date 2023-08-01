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


struct Platform: Hashable {
    let name:String
    let icon:String
}

struct DemoKeyboardView: View {
    
    unowned var controller: KeyboardInputViewController
    
    @State
    private var currentPlatform:Platform?
    
    @EnvironmentObject
    private var keyboardContext: KeyboardContext
    
    var platforms: [Platform] = [
        .init(name: "Auto Text", icon: "doc.plaintext.fill"),
        .init(name: "Produk", icon: "shippingbox.fill"),
        .init(name: "Rate", icon: "box.truck.fill"),
        .init(name: "Order", icon: "doc.fill"),
        .init(name: "Invoice", icon: "doc.fill.badge.plus"),
    ]
    
    
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            if self.currentPlatform == nil {
                HStack(alignment:.top,spacing: 0) {
                    Image("logo")
                        .resizable().scaledToFit()
                        .frame(width: 40,height: 40)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack(spacing: 5) {
                            ForEach(platforms, id: \.name) {platform in
                                Button {
                                    self.currentPlatform = platform
                                } label: {
                                    Label(platform.name, systemImage: platform.icon)
                                }
                            }
                        }
                        .padding(.leading, 5)
                        .buttonStyle(BigButtonStyle())
                    }
                }.padding(5)
            }
            
            switchScreen(name: currentPlatform?.name ?? "")
            
        }
        .toolbar(.hidden, for: .navigationBar)
        .background(Color(0xE5E5E5))
    }
    
    @ViewBuilder
    func switchScreen(name:String)->some View {
        switch name {
        case "Auto Text":
            NavigationView {
                AutoTextScreen(controller: controller)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                self.currentPlatform = nil
                            }) {
                                HStack {
                                    Image(systemName: "chevron.backward")
                                        .foregroundStyle(.blue)
                                    Text("Back")
                                        .font(.system(.body, design: .rounded).bold())
                                        .foregroundColor(.blue)
                                }
                            }
                            
                        }
                    }
            }
        case "Produk":
            NavigationView {
                ProductScreen(controller: controller)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                self.currentPlatform = nil
                            }) {
                                HStack {
                                    Image(systemName: "chevron.backward")
                                        .foregroundStyle(.blue)
                                    Text("Back")
                                        .font(.system(.body, design: .rounded).bold())
                                        .foregroundColor(.blue)
                                }
                            }
                            
                        }
                    }
            }
        case "Order":
            NavigationView {
                OrderScreen(controller: controller)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                self.currentPlatform = nil
                            }) {
                                HStack {
                                    Image(systemName: "chevron.backward")
                                        .foregroundStyle(.blue)
                                    Text("Back")
                                        .font(.system(.body, design: .rounded).bold())
                                        .foregroundColor(.blue)
                                }
                            }
                            
                        }
                    }
            }
        case "Invoice":
            NavigationView {
                InvoiceScreen(controller: controller)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                self.currentPlatform = nil
                            }) {
                                HStack {
                                    Image(systemName: "chevron.backward")
                                        .foregroundStyle(.blue)
                                    Text("Back")
                                        .font(.system(.body, design: .rounded).bold())
                                        .foregroundColor(.blue)
                                }
                            }
                            
                        }
                    }
            }
        case "Rate":
            NavigationView {
                RateScreen(controller: controller)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                self.currentPlatform = nil
                            }) {
                                HStack {
                                    Image(systemName: "chevron.backward")
                                        .foregroundStyle(.blue)
                                    Text("Back")
                                        .font(.system(.body, design: .rounded).bold())
                                        .foregroundColor(.blue)
                                }
                            }
                            
                        }
                    }
            }
            
        default:
            SystemKeyboard(
                controller: controller,
                autocompleteToolbar: .none
            )
        }
    }
}

