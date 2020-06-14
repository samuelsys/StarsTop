//
//  Api.swift
//  StarsTop
//
//  Created by Samuel Furtado on 09/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Alamofire

final class AlamofireApiRequest: RequestProtocol {
    
    var environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
    
    func request<T: Decodable>(model: RequestModel<T>, completion: @escaping RequestProtocol.Result) {
        
        var fullPath = String()
        
        guard let method = model.method else {
            return completion(.failure(RequestError.noMethodSpecified))
        }
        
        if let urlPath = model.urlPath {
           fullPath = fullPath + urlPath
        }
        
        if let page = model.page {
           fullPath = fullPath + "&page=" + String(page)
        }
        
        let baseUrl = environment.getCurrentApiURL()
        
        print(fullPath)
        
        AF.request(baseUrl + fullPath, method: getAlamofireMethod(method))
            .responseDecodable(of: T.self) { (response) in
              switch response.result {
                  case .success(let result):
                    completion(.success(result))
                  case .failure(let error):
                    switch error {
                    case .responseSerializationFailed(_):
                        completion(.failure(RequestError.couldNotDecodeObject))
                    default:
                        completion(.failure(RequestError.genericError))
                    }
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
