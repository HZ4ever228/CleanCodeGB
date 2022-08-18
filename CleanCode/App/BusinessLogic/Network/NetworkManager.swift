//
//  NetworkManager.swift
//  CleanCode
//
//  Created by Anton Hodyna on 09/08/2022.
//

import Foundation
import Alamofire

class NetworkManager: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://murmuring-sierra-96989.herokuapp.com/")!
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}
