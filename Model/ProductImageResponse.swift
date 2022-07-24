//
//  ProductImage.swift
//  ListProduct
//
//  Created by Wahid on 22/07/22.
//

import Foundation

struct ProductImageResponse: Codable {
    let images: [String]?
    
    enum CodingKeys: String, CodingKey {
       case images
    }
}
