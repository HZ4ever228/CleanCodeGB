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
    
    func changeUserData(userId: Int, login: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping
    (AFDataResponse<CommonResult>) -> Void)
    
    func logout(userID: String, completionHandler: @escaping
    (AFDataResponse<CommonResult>) -> Void)
}

extension NetworkManager: AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping
               (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl, login: userName, password:
                                    password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func register(userId: Int, login: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<RegisterResult>) -> Void) {
        let requestModel = Register(baseUrl: baseUrl, userID: userId, login: login, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler:
                        completionHandler)
    }
    
    func changeUserData(userId: Int, login: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void) {
        let requestModel = ChangeUserData(baseUrl: baseUrl, userID: userId, login: login, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func logout(userID: String, completionHandler: @escaping (AFDataResponse<CommonResult>) -> Void) {
        let requestModel = Logout(baseUrl: baseUrl, userID: userID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

