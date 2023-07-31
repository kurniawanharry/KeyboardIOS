//
//  Dropdown.swift
//  orderfaz
//
//  Created by User on 24/07/23.
//

import Foundation
import SwiftUI

struct Dropdown: View {
    var content:[String]
    @Binding var selection:String
    var activeTint:Color
    var inActiveTint:Color
    var dynamic:Bool = true
    
    @State private var expandView:Bool = false
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(alignment: .leading, spacing: 0) {
                if !dynamic {
                    RowVIew(selection, size)
                }
                ForEach(content.filter{
                    dynamic ? true : $0 != selection
                },id: \.self){title in RowVIew(title, size)
                }
            }
            .background(
                Rectangle()
                    .fill(inActiveTint)
            )
            .offset(y: dynamic ? (CGFloat(content.firstIndex(of: selection) ?? 0) * -35) : 0 )
        }
        .frame(height:35)
        .overlay(alignment: .trailing){
            Image(systemName: "chevron.up.chevron.down")
                .padding(.trailing,10)
        }
        .mask(alignment: .top) {
            Rectangle()
                .frame(height:expandView ? CGFloat(content.count) * 35 : 35)
                .offset(y:dynamic && expandView ? CGFloat(content.firstIndex(of: selection) ?? 0 ) * -35 : 0)
                .cornerRadius(5)
        }
    }
    
    @ViewBuilder
    func RowVIew(_ title:String,_ size:CGSize)->some View {
        Text(title)
            .font(.system(size: 14))
            .fontWeight(.semibold)
            .padding(.horizontal)
            .frame(width: size.width,height: size.height,alignment: .leading)
            .background{
                if(selection == title){
                    Rectangle()
                        .fill(activeTint)
                        .transition(.identity)
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.interactiveSpring(response: 0.6,dampingFraction: 0.7,blendDuration: 0.7)){
                    if expandView {
                        expandView = false
                        if dynamic {
                            selection = title
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
                                selection = title
                            }
                        }
                    } else {
                        if selection == title {
                            expandView = true
                        }
                    }
                }
            }
    }
}

struct Dropdown_Previews: PreviewProvider {
    static var previews: some View {
        Dropdown(
            content: ["Kg","g"],
            selection: Binding<String>.constant("Kg"),
            activeTint: .blue,
            inActiveTint: .gray
        )
    }
}
