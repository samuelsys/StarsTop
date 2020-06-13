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

final class RepoListWorker: RepoListWorkerProtocol {
    
    private enum RepoListUrlPaths {
        static let swiftRepositoriesSortedByStars = "/search/repositories?q=language:swift&sort=stars"
    }
    
    private let client: RequestProtocol
    
    init(client: RequestProtocol) {
        self.client = client
    }
    
    func getRepositories(completion: @escaping DataResponseRepositories) {
        
        let requestModel = RequestModel(decoder: Repository.self,
                                        path: RepoListUrlPaths.swiftRepositoriesSortedByStars,
                                        method: .get)
        
        client.request(model: requestModel) { (result) in
            
        }
    }
}
