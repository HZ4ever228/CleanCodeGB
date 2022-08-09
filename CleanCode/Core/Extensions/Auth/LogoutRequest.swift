//
//  LogoutRequest.swift
//  CleanCode
//
//  Created by Anton Hodyna on 05/08/2022.
//

import Foundation
import Alamofire

struct Logout: RequestRouter {
    let baseUrl: URL
    let method: HTTPMethod = .get
    let path: String = "logout.json"
    let userID: Int
    
    var parameters: Parameters? {
        return [
            "id_user" : userID
        ]
    }
}

