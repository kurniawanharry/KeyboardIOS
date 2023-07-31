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
    
    var body: some View {
        ScrollView(.vertical) {
            ForEach(autoText, id: \.id) { text in
                AutoTextCardView(
                    name: text.title,
                    content: text.body,
                    isDefault: text.isDefault
                )
            }
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 20))
    }
}

struct AutoTextListView_Previews: PreviewProvider {
    static var previews: some View {
        AutoTextListView(autoText: [])
    }
}
