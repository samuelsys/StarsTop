//
//  RepoListWorker.swift
//  StarsTop
//
//  Created by Samuel Furtado on 08/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

typealias DataResponseRepositories = ((Repository, Error)) -> Void

protocol RepoListWorkerProtocol {
    func getRepositories(completion: @escaping DataResponseRepositories)
}

class RepoListWorker: RepoListWorkerProtocol {
    
    private let api: ApiProtocol
    
    init(api: ApiProtocol) {
        self.api = api
    }
    
    func getRepositories(completion: @escaping DataResponseRepositories) {
        api.get(decoder: Repository.self) { (dataResponse) in
            print(dataResponse)
        }
    }
    
}
