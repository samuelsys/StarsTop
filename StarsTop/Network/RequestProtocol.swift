//
//  RequestProtocol.swift
//  StarsTop
//
//  Created by Samuel Furtado on 11/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Alamofire

enum HttpMethod {
    case get
    case post
}

struct RequestModel<T> {
    let decoder: T.Type
    let path: String
    let method: HttpMethod?
}

protocol RequestProtocol {
    typealias Result = ((Swift.Result<Decodable, Error>) -> Void)
    
    func request<T: Decodable>(requestModel: RequestModel<T.Type>, completion: @escaping Result)
}
