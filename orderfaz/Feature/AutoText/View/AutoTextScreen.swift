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
        NavigationView {
            VStack {
                if autoVM.loading {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else {
                    ScrollView(.vertical) {
                        KeyboardTextField("Type text here...", text: $autoVM.search, controller: controller)
                            .focused($isFocused, doneButton: doneButton)
                                        .padding(5).frame(height: 30)

                        
                        AutoTextListView(
                            autoText: autoVM.autoTexts
                        )
                    }
                    
                }
                if isFocused {
                    SystemKeyboard(
                        controller: controller,
                        autocompleteToolbar: .none
                    )
                }
            }
        }
     
    }
}

struct AutoTextScreen_Previews: PreviewProvider {
    static var previews: some View {
        AutoTextScreen(controller: KeyboardInputViewController())
    }
}
