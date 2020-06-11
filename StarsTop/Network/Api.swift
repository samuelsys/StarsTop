//
//  Api.swift
//  StarsTop
//
//  Created by Samuel Furtado on 09/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Alamofire

protocol ApiProtocol {
    func get<T: Decodable>(decoder: T.Type, completion: @escaping (DataResponse<T, AFError>) -> Void)
}

class Api: ApiProtocol {
    
    func get<T: Decodable>(decoder: T.Type, completion: @escaping (DataResponse<T, AFError>) -> Void) {
        AF.request(ApiConstants.baseUrl, method: .get)
            .responseDecodable(of: T.self) { (responseData) in
                completion(responseData)
        }
    }
}
