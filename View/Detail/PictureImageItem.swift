//  PictureProductItem.swift
//  ListProduct
//  Created by Wahid on 22/07/22.
//

import SwiftUI
import URLImage
import ListPlaceholder

struct ProductImageItem: View {
    
    let imageURL:String?
    
    func image() -> URL {
        if let url  = imageURL {
            return URL(string: url) ?? URL(string: IMAGE_DEFAULT)!
        }else {
            return URL(string: IMAGE_DEFAULT)!
        }
    }
    
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            URLImage(image()) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

