//
//  RepoListWorker.swift
//  StarsTop
//
//  Created by Samuel Furtado on 08/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

typealias DataResponseRepositories = ((repository: Repository?, error: Error?)) -> Void

protocol RepoListWorkerProtocol {
    func getRepositories(page: Int, completion: @escaping DataResponseRepositories)
}

final class RepoListWorker: RepoListWorkerProtocol {
    
    private enum RepoListUrlPaths {
        static let swiftRepositoriesSortedByStars = "search/repositories?q=language:swift&sort=stars"
    }
    
    private let client: RequestProtocol
    
    init(client: RequestProtocol) {
        self.client = client
    }
    
    func getRepositories(page: Int, completion: @escaping DataResponseRepositories) {
        
        let requestModel = RequestModel(decoder: Repository.self,
                                        urlPath: RepoListUrlPaths.swiftRepositoriesSortedByStars,
                                        mockPath: "repositories-page",
                                        method: .get,
                                        page: page)
        
        client.request(model: requestModel) { (result) in
            switch result {
            case .success(let result):
                if let repository = result as? Repository {
                    completion((repository: repository, error: nil))
                }
            case .failure(let error):
                completion((repository: nil, error: error))
            }
        }
    }
}
