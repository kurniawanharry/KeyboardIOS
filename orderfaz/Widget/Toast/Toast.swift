//
//  Toast.swift
//  orderfaz
//
//  Created by User on 27/07/23.
//

import Foundation

struct Toast: Equatable {
  var style: ToastStyle
  var message: String
  var duration: Double = 3
  var width: Double = .infinity
}
