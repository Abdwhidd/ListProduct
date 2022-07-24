//
//  GridViewItem.swift
//  ListProduct
//
//  Created by Wahid on 22/07/22.
//

import SwiftUI
import URLImage

struct GridViewItem: View {
    
    let item: Product
    @Binding var columns: [GridItem]
    
    var body: some View {
            VStack {
                AsyncImage(url: URL(string: item.attributes.images.first ?? "")) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                VStack(alignment:.leading) {
                    Text(item.attributes.name)
                        .font(.headline)
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        
                        Image("IconPoints")
                        
                        Text("\(Int(item.attributes.points))")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                            .lineLimit(5)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            .padding(.all, 18)
//            .border(Color.gray, width: 1)
            .cornerRadius(5)
        }
}

