//
//  RequestManager.swift
//  StarsTop
//
//  Created by Samuel Furtado on 12/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

final class RequestManager: RequestProtocol {
    internal var environment: Environment
    private var apiRequest: RequestProtocol
    private var mockRequest: RequestProtocol
       
    init(environment: Environment, apiRequest: RequestProtocol, mockRequest: RequestProtocol) {
        self.environment = environment
        self.apiRequest = apiRequest
        self.mockRequest = mockRequest
    }
    
    func request<T>(model: RequestModel<T>, completion: @escaping RequestProtocol.Result) where T : Decodable {
        let req = environment.getCurrent() == Environment.Scheme.mock ? mockRequest : apiRequest
        
        req.request(model: model) { (resultResponse) in
            completion(resultResponse)
        }
    }
}
