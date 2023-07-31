//
//  Extensions.swift
//  orderfaz
//
//  Created by User on 28/07/23.
//

import Foundation
import SwiftUI

extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}


extension ToastStyle {
  var themeColor: Color {
    switch self {
    case .error: return Color.red
    case .warning: return Color.orange
    case .info: return Color.blue
    case .success: return Color.green
    }
  }
  
  var iconFileName: String {
    switch self {
    case .info: return "info.circle.fill"
    case .warning: return "exclamationmark.triangle.fill"
    case .success: return "checkmark.circle.fill"
    case .error: return "xmark.circle.fill"
    }
  }
}

extension View {

  func toastView(toast: Binding<Toast?>) -> some View {
    self.modifier(ToastModifier(toast: toast))
  }
}

extension URLRequest {
    mutating func header() {
        self.timeoutInterval = 20
        self.addValue("application/json", forHTTPHeaderField: "Content-Type")
        self.addValue("application/json", forHTTPHeaderField: "Accept")
        self.setValue("Bearer \(Env.TOKEN)", forHTTPHeaderField: "Authorization")
    }
}
