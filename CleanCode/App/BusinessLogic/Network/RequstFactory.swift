//
//  RequstFactory.swift
//  CleanCode
//
//  Created by Anton Hodyna on 05/08/2022.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return NetworkManager(errorParser: errorParser, sessionManager: commonSession,
                    queue: sessionQueue)
    }
    
    func makeProductRequestFatory() -> ProductRequstFactory {
        let errorParser = makeErrorParser()
        return NetworkManager(errorParser: errorParser, sessionManager: commonSession,
                    queue: sessionQueue)
    }
}
