//
//  Product.swift
//  MeLi Challenge Tech
//
//  Created by Arturo González on 20/04/22.
//

import Foundation

// MARK: - Product
struct Product: Codable {
    let results: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let title: String?
    let price: Double?
    let availableQuantity, soldQuantity: Int?
    let condition: String?
    let permalink: String?
    let thumbnail: String?
    let shipping: Shipping?

    enum CodingKeys: String, CodingKey {
        case title, price
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case condition, permalink, thumbnail
        case shipping
    }
}

// MARK: - Shipping
struct Shipping: Codable {
    let freeShipping: Bool?
    let mode: String?
    let tags: [String]?
    let storePickUp: Bool?

    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
        case mode, tags
        case storePickUp = "store_pick_up"
    }
}

