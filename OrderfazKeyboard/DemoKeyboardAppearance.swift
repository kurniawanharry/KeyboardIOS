//
//  DemoKeyboardAppearance.swift
//  Keyboard
//
//  Created by Daniel Saidi on 2022-12-21.
//  Copyright © 2022-2023 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This demo-specific appearance inherits the standard one and
 customizes the look of the keyboard.

 ``KeyboardViewController`` registers this class to show you
 how you can set up a custom keyboard appearance.

 Just comment out any of the functions below to override any
 part of the standard appearance.
 */
class DemoKeyboardAppearance: StandardKeyboardAppearance {
    
//
    override func buttonImage(for action: KeyboardAction) -> Image? {
        if action == .keyboardType(.emojis) { return nil }
        return super.buttonImage(for: action)
    }
    
    override func buttonStyle(
        for action: KeyboardAction,
        isPressed: Bool
    ) -> KeyboardButtonStyle {
        var style = super.buttonStyle(for: action, isPressed: isPressed)
        style.cornerRadius = 6
        style.shadow =  KeyboardButtonShadowStyle.standard
        style.backgroundColor = action.isSystemAction ? action.isPrimaryAction ? Color(0xFF2563EB) : Color(0xFFCBCED5) :  action.isInputAction ? .white : Color(0xFF2563EB)
        style.foregroundColor = action.isSystemAction ? action.isPrimaryAction ? .white : Color(0xFF475569)  :  action.isInputAction ? Color(0xFF475569) : .white
        return style
    }
    
    override func buttonText(for action: KeyboardAction) -> String? {
        if action == .keyboardType(.emojis) { return "😀" }
        return super.buttonText(for: action)
    }
    
    override var actionCalloutStyle: KeyboardActionCalloutStyle {
        var style = super.actionCalloutStyle
        style.callout.backgroundColor = Color(0xFF2563EB)
        style.callout.textColor = .white
        style.selectedBackgroundColor = .black.opacity(0.2)
        return style
    }
    
    override var inputCalloutStyle: KeyboardInputCalloutStyle {
        var style = super.inputCalloutStyle
        style.callout.backgroundColor = Color(0xFF2563EB)
        style.callout.textColor = .white
        return style
    }
}
