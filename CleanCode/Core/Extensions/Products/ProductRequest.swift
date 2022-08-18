//
//  ProductRequst.swift
//  CleanCode
//
//  Created by Anton Hodyna on 09/08/2022.
//

import Foundation
import Alamofire

struct ProductRequest: RequestRouter {
    let baseUrl: URL
    let method: HTTPMethod = .post
    let path: String = "getProduct"
    let productID: Int
    var parameters: Parameters? {
        return [
            "id_product": productID,
        ]
    }
}
