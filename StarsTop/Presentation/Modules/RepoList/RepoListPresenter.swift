//
//  RepoListPresenter.swift
//  StarsTop
//
//  Created by Samuel Furtado on 08/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

protocol RepoListInteractorOutputProtocol: class {
    func interactor(didRetrieveRepositories repositories: [RepositoryViewModel])
    func interactor(didFailRetrieveRepositories error: Error)
}

class RepoListPresenter: RepoListInteractorOutputProtocol {
    
    weak var viewController: RepoListPresenterOutputProtocol?
    
    // MARK: - RepoListPresenterProtocol conforms
    
    func interactor(didRetrieveRepositories repositories: [RepositoryViewModel]) {
    }
    
    func interactor(didFailRetrieveRepositories error: Error) {
    }
    
}
