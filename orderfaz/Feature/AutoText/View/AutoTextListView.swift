//
//  AutoTextList.swift
//  orderfaz
//
//  Created by User on 12/07/23.
//

import Foundation
import SwiftUI

struct AutoTextListView: View {
    let autoText:[AutoTextViewModel]
    let onTap:(_ content:String)-> Void
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(autoText, id: \.id) { text in
                AutoTextCardView(
                    name: text.title,
                    content: text.body,
                    isDefault: text.isDefault,
                    onTap: onTap
                )
            }
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 20))
    }
}

struct AutoTextListView_Previews: PreviewProvider {
    static var previews: some View {
        AutoTextListView(autoText: [],onTap: {content in})
    }
}
