//
//  Mock.swift
//  StarsTop
//
//  Created by Samuel Furtado on 11/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

final class MockRequest: RequestProtocol {
    var environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
    
    func request<T>(model: RequestModel<T>, completion: @escaping RequestProtocol.Result) where T : Decodable {
        
    }
}
