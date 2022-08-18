//
//  RegisterRequest.swift
//  CleanCode
//
//  Created by Anton Hodyna on 05/08/2022.
//

import Foundation
import Alamofire

struct Register: RequestRouter {
    let baseUrl: URL
    let method: HTTPMethod = .post
    let path: String = "register"
    let userID: Int
    let login: String
    let password: String
    let email: String
    let gender: String
    let creditCard: String
    let bio: String
    
    var parameters: Parameters? {
        return [
            "id_user" : userID,
            "username": login,
            "password": password,
            "email": email,
            "gender": gender,
            "credit_card": creditCard,
            "bio": bio
        ]
    }
}
