//
//  Gift.swift
//  ListProduct
//
//  Created by Wahid on 21/07/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gift = try? newJSONDecoder().decode(Gift.self, from: jsonData)

import Foundation

// MARK: - Gift
struct ProductsResponse: Codable {
    let data: [Product]
}

// MARK: - Datum
struct Product: Codable, Identifiable {
    let id: String
    let type: String
    let attributes: Attributes
}

// MARK: - Attributes
struct Attributes: Codable, Identifiable {
    let id: Int
    let name, info, description: String
    let points: Int
    let slug: String
    let stock: Int
    let images: [String]
    let isNew: Int
    let rating: Double
    let numOfReviews, isWishlist: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, info
        case description
        case points, slug, stock, images, isNew, rating, numOfReviews, isWishlist
    }
}
