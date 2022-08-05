//
//  RegisterRequstFactory.swift
//  CleanCode
//
//  Created by Anton Hodyna on 05/08/2022.
//

import Foundation

import Alamofire

protocol RegisterRequstFactory {
    func register(userId: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping
    (AFDataResponse<LoginResult>) -> Void)
}
