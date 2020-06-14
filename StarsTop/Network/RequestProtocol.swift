//
//  RequestProtocol.swift
//  StarsTop
//
//  Created by Samuel Furtado on 11/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

enum RequestError: Error {
    case noMethodSpecified
    case noPathSpecified
    case noPageSpecified
    case noPageFound
    case couldNotDecodeObject
    case genericError
}

enum HttpMethod {
    case get
    case post
}

struct RequestModel<T> {
    let decoder: T.Type
    let urlPath: String?
    let mockPath: String?
    let method: HttpMethod?
    let page: Int?
}

protocol RequestProtocol {
    typealias Result = ((Swift.Result<Any, Error>) -> Void)
    
    var environment: Environment {get set}
    
    func request<T: Decodable>(model: RequestModel<T>, completion: @escaping Result)
}
