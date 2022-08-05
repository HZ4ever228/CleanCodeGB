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
}
