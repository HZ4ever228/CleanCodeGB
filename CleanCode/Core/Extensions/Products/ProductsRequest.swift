//
//  ProductsRequest.swift
//  CleanCode
//
//  Created by Anton Hodyna on 09/08/2022.
//

import Foundation
import Alamofire

struct ProductsRequest: RequestRouter {
    let baseUrl: URL
    let method: HTTPMethod = .post
    let path: String = "getProducts"
    let pageNumber: String
    let categoryID: String
    var parameters: Parameters? {
        return [
            "page_number": pageNumber,
            "id_category": categoryID
        ]
    }
}
