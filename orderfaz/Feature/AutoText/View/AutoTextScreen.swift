//
//  AutoText.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation
import KeyboardKit
import SwiftUI

struct AutoTextScreen: View {
    @StateObject private var autoVM = AutotextListViewModel()
    
    unowned var controller: KeyboardInputViewController
    
    @FocusState private var isFocused:Bool
    
    var body: some View {
        VStack {
            KeyboardTextField("Cari Autotext..", text: $autoVM.search, controller: controller)
                .focused($isFocused, doneButton: doneButton)
                .frame(height: 30)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 20))
            
            if autoVM.loading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                AutoTextListView(
                    autoText: autoVM.autoTexts,
                    onTap: { content in
                        controller.insertText(content)
                    }
                )
            }
            
            if isFocused {
                SystemKeyboard(
                    controller: controller,
                    autocompleteToolbar: .none
                )
                .background(Color(0xE5E5E5))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Auto Text")
        .toolbarBackground(.visible, for: .navigationBar)
        
    }
}

struct AutoTextScreen_Previews: PreviewProvider {
    static var previews: some View {
        AutoTextScreen(controller: KeyboardInputViewController())
    }
}
