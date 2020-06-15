//
//  RepoListWorkerMock.swift
//  StarsTopTests
//
//  Created by Samuel Furtado on 14/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
@testable import StarsTop

class RepoListWorkerMockGenericError: RepoListWorkerProtocol {
    func getRepositories(page: Int, completion: @escaping DataResponseRepositories) {
        completion((repository: nil, error: RequestError.genericError))
    }
}

class RepoListWorkerMockErrorWithMessage: RepoListWorkerProtocol {
    func getRepositories(page: Int, completion: @escaping DataResponseRepositories) {
        let repository = Repository(items: nil, message: "could not retrieve items")
        completion((repository: repository, error: nil))
    }
}
