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
    
    private enum Constants {
        static let swiftRepositoriesSortedByStars = "search/repositories?q=language:swift&sort=stars"
        static let mockPath = "repositories-page"
    }
    
    // MARK: - Properties
    
    private let client: RequestProtocol
    
    // MARK: - Initialization
    
    init(client: RequestProtocol) {
        self.client = client
    }
    
    // MARK: - RepoListWorkerProtocol Conforms
    
    func getRepositories(page: Int, completion: @escaping DataResponseRepositories) {
        
        let requestModel = RequestModel(decoder: Repository.self,
                                        urlPath: Constants.swiftRepositoriesSortedByStars,
                                        mockPath: Constants.mockPath,
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
