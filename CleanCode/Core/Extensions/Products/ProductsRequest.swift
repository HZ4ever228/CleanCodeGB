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
    let method: HTTPMethod = .get
    let path: String = "catalogData.json"
    let pageNumber: Int
    let categoryID: Int
    var parameters: Parameters? {
        return [
            "page_number": pageNumber,
            "id_category": categoryID
        ]
    }
}
