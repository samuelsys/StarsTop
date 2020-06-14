//
//  RepoListInteractor.swift
//  StarsTop
//
//  Created by Samuel Furtado on 08/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

protocol RepoListInteractorProtocol: class {
    func loadRepositories(page: Int)
    func didSelectRow(at index: Int)
}

final class RepoListInteractor {
    
    private var presenter: RepoListInteractorOutputProtocol
    private var worker: RepoListWorkerProtocol
    
    init(presenter: RepoListInteractorOutputProtocol, worker: RepoListWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func loadRepositories(page: Int) {
        worker.getRepositories(page: page) { [weak self] (repositoryResponse) in
                        
            guard let repositoryDecodable = repositoryResponse.repository else {
                self?.presenter.interactor(didFailRetrieveRepositories: repositoryResponse.error ?? RequestError.genericError)
                return
            }
            
            if let message = repositoryDecodable.message, repositoryDecodable.items == nil {
                self?.presenter.interactor(didFailRetrieveRepositoriesWithMessage: message)
            } else {
                self?.presenter.interactor(didRetrieveRepositories: repositoryDecodable.toRepositoryViewModelList())
            }
        }
    }
    
    func didSelectRow(at index: Int) {
    }
    
}

extension Repository {
    func toRepositoryViewModelList() -> [RepositoryViewModel] {
        guard let items = self.items else { return [] }
        return items.map { (item) -> RepositoryViewModel in
            return RepositoryViewModel(name: item.name, stars: item.stars, photo: item.owner.avatarUrl, author: item.owner.login)
        }
    }
}
