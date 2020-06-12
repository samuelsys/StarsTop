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
    
    func request<T: Decodable>(requestModel: RequestModel<T.Type>, completion: @escaping RequestProtocol.Result) {
        
        guard let method = requestModel.method else {
            return completion(.failure(AlamofireApiError.noMethodSpecified))
        }
        
        AF.request(requestModel.path, method: getAlamofireMethod(method))
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
