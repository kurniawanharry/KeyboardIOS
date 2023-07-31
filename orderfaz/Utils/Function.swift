//
//  Function.swift
//  orderfaz
//
//  Created by User on 19/07/23.
//

import Foundation
import SwiftUI


func displayDate(date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMM yyyy"
    
    let temp = dateFormatter.date(from: date)
    return dateFormatter.string(from: temp ?? Date())
}


func orderStatus(status:Int) -> String {
    switch status {
    case 100: return "Belum Bayar";
    case 200: return "Pending"
    case 201: return "Waiting For AWB"
    case 202: return "Failed Getting AWB"
    case 300: return "Menunggu Diproses"
    case 350: return "Problem Pending"
    case 400: return "Dalam Proses"
    case 401: return "Problem Delivery"
    case 402: return "In Process Return"
    case 403: return "Problem Return"
    case 500: return "Completed"
    case 700: return "Cancel"
    case 701: return "Expired"
    case 702: return "Returned"
    case 703: return "Lost/Broken"
    case 999: return "Seller Update"
    default:
        return "UNDEFINED"
    }
    
}

func orderStatusCategory(value: Int?)-> Int {
    switch value {
    case 100: return 800
    case 200: return 700
    case 300: return 100
    case 400: return 200
    case 401: return 500
    case 403: return 600
    case 500: return 300
    case 703: return 400
    default:
        return 700
    }
}


struct NormalButton: ButtonStyle {
    
    @State var color: Color = Color(0xFFFAFAFA)
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14))
            .padding(10)
            .fontWeight(Font.Weight.semibold)
            .frame(maxWidth: .infinity)
            .foregroundColor(isEnabled ?  configuration.isPressed ?
                             Color(0xFF737373) : .white
                             : Color(UIColor.systemGray3))
            .background(isEnabled ?  configuration.isPressed ?
                        color :  Color(0xFF2563EB)  : Color(UIColor.systemGray5))
            .cornerRadius(5)
    }
}


struct BigButtonStyle: ButtonStyle {
    
    @State var color: Color = Color(0xFFFAFAFA)
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14))
            .padding(10)
            .fontWeight(Font.Weight.semibold)
            .frame(maxWidth: .infinity)
            .foregroundColor(isEnabled ?  configuration.isPressed ?
                .white :  Color(0xFF737373)
                             : Color(UIColor.systemGray3))
            .background(isEnabled ?  configuration.isPressed ?
                        Color(0xFF2563EB)  : color : Color(UIColor.systemGray5))
            .cornerRadius(20)
    }
}

struct NotifButton: ButtonStyle {
    
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 12)).bold()
            .padding(10)
            .scaledToFit()
            .scaledToFit()
            .foregroundColor(configuration.isPressed ? Color(0xFF2563EB) : .white)
            .background(configuration.isPressed ? Color(0xFF737373)  : Color(0xFF2563EB))
            .cornerRadius(10)
    }
}


class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

func durationMethod(type:String)->String{
    switch type {
    case "DAY":
        return "Hari"
    case "HOUR":
        return "Jam"
    default:
        return ""
    }
}

func weightCalculation(value:Int, type: String) -> Int{
    if(type == "Kg"){
        return value / 1000
    } else {
        return value * 1000
    }
}


func doneButton() -> some View {
       Image(systemName: "x.circle.fill")
   }

