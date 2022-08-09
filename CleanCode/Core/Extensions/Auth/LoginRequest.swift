//
//  LoginRequest.swift
//  CleanCode
//
//  Created by Anton Hodyna on 05/08/2022.
//

import Foundation
import Alamofire

struct Login: RequestRouter {
    let baseUrl: URL
    let method: HTTPMethod = .get
    let path: String = "login.json"
    let login: String
    let password: String
    var parameters: Parameters? {
        return [
            "username": login,
            "password": password
        ]
    }
}
