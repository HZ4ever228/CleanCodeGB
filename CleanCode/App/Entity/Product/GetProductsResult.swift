//
//  GetProductsResult.swift
//  CleanCode
//
//  Created by Anton Hodyna on 09/08/2022.
//

import Foundation

struct GetProductsResult: Codable {
    let pageNumber: Int
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case products = "products"
    }
}

struct Product: Codable {
    let productID: Int
    let productName: String
    let productPrice: Int
    
    enum CodingKeys: String, CodingKey {
        case productID = "id_product"
        case productName = "product_name"
        case productPrice = "price"
    }
}
