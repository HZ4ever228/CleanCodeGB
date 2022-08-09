//
//  GetProductResult.swift
//  CleanCode
//
//  Created by Anton Hodyna on 09/08/2022.
//

import Foundation

struct GetProductResult: Codable {
    let result: Int
    let productName: String
    let productPrice: Int
    let productDescription: String
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case productName = "product_name"
        case productPrice = "product_price"
        case productDescription = "product_description"
    }
}
