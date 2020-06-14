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
    
    private enum RepoListInteractorError: Error {
        case genericError
    }
    
    private var presenter: RepoListInteractorOutputProtocol
    private var worker: RepoListWorkerProtocol
    
    init(presenter: RepoListInteractorOutputProtocol, worker: RepoListWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func loadRepositories(page: Int) {
        worker.getRepositories(page: page) { [weak self] (repositoryResponse) in
                        
            guard let repositoryDecodable = repositoryResponse.repository else {
                let error = repositoryResponse.error ?? RepoListInteractorError.genericError
                self?.presenter.interactor(didFailRetrieveRepositories: error)
                return
            }
            self?.presenter.interactor(didRetrieveRepositories: repositoryDecodable.toRepositoryViewModelList())
        }
    }
    
    func didSelectRow(at index: Int) {
    }
    
}

extension Repository {
    func toRepositoryViewModelList() -> [RepositoryViewModel] {
        return self.items.map { (item) -> RepositoryViewModel in
            return RepositoryViewModel(name: item.name, stars: item.stars, photo: item.owner.avatarUrl, author: item.owner.login)
        }
    }
}
