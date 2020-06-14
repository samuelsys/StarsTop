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
    func interactor(didFailRetrieveRepositoriesWithMessage message: String)
}

final class RepoListPresenter: RepoListInteractorOutputProtocol {
    
    // MARK: - Properties
    
    weak var viewController: RepoListPresenterOutputProtocol?
    
    // MARK: - RepoListPresenterProtocol conforms
    
    func interactor(didRetrieveRepositories repositories: [RepositoryViewModel]) {
        viewController?.presenter(didRetrieveItems: repositories)
    }
    
    func interactor(didFailRetrieveRepositories error: Error) {
        viewController?.presenter(didFailRetrieveItems: error)
    }
    
    func interactor(didFailRetrieveRepositoriesWithMessage message: String) {
        viewController?.presenter(didFailRetrieveItemsWithMessage: message)
    }
}
