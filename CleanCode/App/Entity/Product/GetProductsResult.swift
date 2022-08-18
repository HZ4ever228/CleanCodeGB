//
//  GetProductsResult.swift
//  CleanCode
//
//  Created by Anton Hodyna on 09/08/2022.
//

import Foundation

struct GetProductsResult: Codable {
    let pageNumber: String
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case products = "products"
    }
}

