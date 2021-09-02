//
//  ApiClient.swift
//  SpaceXApp
//
//  Created by Arda on 24.08.2021.
//

import UIKit
import SimpleApiClient

class ApiClient: SimpleApiClient {
    static var shared: ApiClient = {
        let config = SimpleApiClient.Config(
            baseUrl: api.url,
            timeout: 30,
            errorMessageKeyPath: "error",
            jsonDecoder: JSONDecoder(),
            isMockResponseEnabled: true,
            logHandler: { request, response in
               
        },
            errorHandler: { error in
                switch error {
                case .authenticationError(let code, let message):
                    print("authenticationError: \(code) \(message)")
                case .clientError(let code, let message):
                    print("clientError: \(code) \(message)")
                case .serverError(let code, let message):
                    print("serverError: \(code) \(message)")
                case .networkError(let source):
                    print("networkError")
                case .sslError(let source):
                    print("sslError")
                case .uncategorizedError(let source):
                    print("uncategorizedError")
                }
        }
        )
        return ApiClient(config: config)
    }()
}
