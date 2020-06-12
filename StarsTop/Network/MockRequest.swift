//
//  Mock.swift
//  StarsTop
//
//  Created by Samuel Furtado on 11/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

final class MockRequest: RequestProtocol {
    func request<T: Decodable>(requestModel: RequestModel<T.Type>, completion: @escaping RequestProtocol.Result) {
        // TODO: Build Mock Folder, Get path and return result
    }
}
