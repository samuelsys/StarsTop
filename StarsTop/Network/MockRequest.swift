//
//  Mock.swift
//  StarsTop
//
//  Created by Samuel Furtado on 11/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

final class MockRequest: RequestProtocol {
    var environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
    
    func request<T>(model: RequestModel<T>, completion: @escaping RequestProtocol.Result) where T : Decodable {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            
            var fullPath = String()
            
            guard let path = model.mockPath else {
                return completion(.failure(RequestError.noPathSpecified))
            }
            
            fullPath = path
            
            if let page = model.page {
                fullPath = fullPath + String(page)
            }
            
            guard let url = Bundle.main.url(forResource: fullPath + "-mock", withExtension: "json") else {
                return  completion(.failure(RequestError.noPageFound))
            }
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(model.decoder.self, from: data)
                
                completion(.success(jsonData))
                
            } catch {
                completion(.failure(RequestError.couldNotDecodeObject))
            }
        }
    }
}
