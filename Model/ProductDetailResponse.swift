//
//  ProductDetailResponse.swift
//  ListProduct
//
//  Created by Wahid on 22/07/22.
//


import Foundation

struct ProductDetailResponse: Codable {
    let id: Int
    let name, info, description: String
    let points: Int
    let slug: String
    let stock: Int
    let images: [String]?
    let isNew: Int
    let rating: Double
    let numOfReviews, isWishlist: Int

    enum CodingKeys: String, CodingKey {
        case id, name, info
        case description
        case points, slug, stock, images, isNew, rating, numOfReviews, isWishlist
    }
}
