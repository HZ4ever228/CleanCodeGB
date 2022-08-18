//
//  Product.swift
//  CleanCode
//
//  Created by Anton Hodyna on 18/08/2022.
//

import Foundation

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
