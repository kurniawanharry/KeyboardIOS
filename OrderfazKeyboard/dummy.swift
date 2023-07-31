//
//  dummy.swift
//  OrderfazKeyboard
//
//  Created by User on 31/07/23.
//

import KeyboardKit
import Foundation
import SwiftUI


struct Dummy: View {
    @State
     private var text1 = ""

     @State
     private var text2 = ""

     @FocusState
     private var isFocused1: Bool

     @FocusState
     private var isFocused2: Bool

     unowned var controller: KeyboardInputViewController
    var body: some View {
        VStack {
            KeyboardTextField("Type text here...", text: $text1, controller: controller)
                            .focused($isFocused1, doneButton: doneButton)
                            .padding(3)

                        KeyboardTextView(text: $text2, controller: controller)
                            .focused($isFocused2, doneButton: doneButton)
                            .frame(height: 80)
                            .padding(3)
            if isFocused1 || isFocused2{
                SystemKeyboard(
                    controller: controller,
                    autocompleteToolbar: .none
                )
            }
        }
    }
    
    func doneButton() -> some View {
           Image(systemName: "x.circle.fill")
       }
}

struct Dummy_Previews: PreviewProvider {
    static var previews: some View {
        Dummy(controller: KeyboardInputViewController())
    }
}
