//
//  AuthRequstFactory.swift
//  CleanCode
//
//  Created by Anton Hodyna on 05/08/2022.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping
    (AFDataResponse<LoginResult>) -> Void)
    
    func register(userId: Int, login: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping
    (AFDataResponse<RegisterResult>) -> Void)
    
    func logout(userID: Int, completionHandler: @escaping
    (AFDataResponse<RegisterResult>) -> Void)
}
