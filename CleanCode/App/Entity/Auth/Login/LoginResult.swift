//
//  LoginResult.swift
//  CleanCode
//
//  Created by Anton Hodyna on 05/08/2022.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
    var error_message: String?
}
