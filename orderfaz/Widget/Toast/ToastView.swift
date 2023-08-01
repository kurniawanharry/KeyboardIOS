//
//  ToastView.swift
//  orderfaz
//
//  Created by User on 27/07/23.
//

import Foundation
import SwiftUI

struct ToastView: View {
  
  var style: ToastStyle
  var message: String
  var width = CGFloat.infinity
  var onCancelTapped: (() -> Void)
  
  var body: some View {
    HStack(alignment: .center, spacing: 12) {
      Image(systemName: style.iconFileName)
            .foregroundColor(style.themeColor)
      Text(message)
        .font(Font.caption)
        .foregroundColor(style.themeColor)
      
      Spacer(minLength: 10)
      
      Button {
        onCancelTapped()
      } label: {
        Image(systemName: "xmark")
          .foregroundColor(style.themeColor)
      }
    }
    .padding()
    .frame(minWidth: 0, maxWidth: width)
    .background(style.themeColor.opacity(0.2))
    .cornerRadius(8)
    .padding(.horizontal, 16)
  }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(style: .success, message: "Invoice berhasil dibuat!", onCancelTapped: {})
    }
}
