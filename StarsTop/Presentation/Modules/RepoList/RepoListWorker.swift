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
    
    private enum RepoListUrlPaths {
        static let swiftRepositoriesSortedByStars = "/search/repositories?q=language:swift&sort=stars"
    }
    
    private let client: RequestProtocol
    
    init(client: RequestProtocol) {
        self.client = client
    }
    
    func getRepositories(completion: @escaping DataResponseRepositories) {
        //client.request(requestModel: RequestModel<Decodable>, completion: <#T##((Result<Decodable, Error>) -> Void)##((Result<Decodable, Error>) -> Void)##(Result<Decodable, Error>) -> Void#>)
    }
    
    private func buildRequestModel()  {
        //RequestModel(decoder: Repository.self, baseUrl: "", path: RepoListUrlPaths.swiftRepositoriesSortedByStars, method: .get)
    }
    
}
