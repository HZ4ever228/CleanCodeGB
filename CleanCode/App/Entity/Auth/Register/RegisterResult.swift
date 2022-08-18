//
//  RegisterResult.swift
//  CleanCode
//
//  Created by Anton Hodyna on 05/08/2022.
//

import Foundation

struct RegisterResult: Codable {
    let result: Int
    let user_message: String?
    let error_message: String?
}
