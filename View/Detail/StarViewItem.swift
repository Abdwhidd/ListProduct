//
//  StarViewItem.swift
//  ListProduct
//
//  Created by Wahid on 22/07/22.
//

import SwiftUI

struct StarViewItem: View {
    
    var body: some View {
        HStack {
            ForEach(0..<5) { _ in
                Image("IconStar")
            }
        }
    }
}

struct StarViewItem_Previews: PreviewProvider {
    static var previews: some View {
        StarViewItem()
    }
}
