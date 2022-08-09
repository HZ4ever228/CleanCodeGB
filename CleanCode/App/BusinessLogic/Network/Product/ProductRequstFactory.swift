//
//  ProductRequstFactory.swift
//  CleanCode
//
//  Created by Anton Hodyna on 09/08/2022.
//

import Foundation
import Alamofire

protocol ProductRequstFactory {
    func getProducts(pageNumber: Int, categoryID: Int, completionHandler: @escaping (AFDataResponse<[Product]>) -> Void)
    
    func getProduct(productID: Int, completionHandler: @escaping (AFDataResponse<GetProductResult>) -> Void)
}

extension NetworkManager: ProductRequstFactory {
    func getProducts(pageNumber: Int, categoryID: Int, completionHandler: @escaping (AFDataResponse<[Product]>) -> Void) {
        let requestModel = ProductsRequest(baseUrl: baseUrl, pageNumber: pageNumber, categoryID: categoryID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getProduct(productID: Int, completionHandler: @escaping (AFDataResponse<GetProductResult>) -> Void) {
        let requestModel = ProductRequest(baseUrl: baseUrl, productID: productID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
