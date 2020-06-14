//
//  Api.swift
//  StarsTop
//
//  Created by Samuel Furtado on 09/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Alamofire

enum AlamofireApiError: Error {
    case noMethodSpecified
}

final class AlamofireApiRequest: RequestProtocol {
    
    var environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
    
    func request<T: Decodable>(model: RequestModel<T>, completion: @escaping RequestProtocol.Result) {
        
        var pageString = String()
        
        guard let method = model.method else {
            return completion(.failure(AlamofireApiError.noMethodSpecified))
        }
        
        if let page = model.page {
           pageString = "&page=" + String(page)
        }
        
        let baseUrl = environment.getCurrentApiURL()
        
        AF.request(baseUrl + model.path + pageString, method: getAlamofireMethod(method))
            .responseDecodable(of: T.self) { (response) in
              switch response.result {
                  case .success(let result):
                    completion(.success(result))
                  case .failure(let error):
                    completion(.failure(error))
              }
        }
    }
    
    private func getAlamofireMethod(_ method: HttpMethod) -> Alamofire.HTTPMethod {
        switch method {
        case .get:
            return Alamofire.HTTPMethod.get
        case .post:
            return Alamofire.HTTPMethod.post
        }
    }
}
