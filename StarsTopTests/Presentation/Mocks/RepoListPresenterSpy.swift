//
//  RepoListPresenterSpy.swift
//  StarsTopTests
//
//  Created by Samuel Furtado on 14/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
@testable import StarsTop

class RepoListPresenterSpy: RepoListInteractorOutputProtocol {
    
    var invokedDidRetrieveRepositories = false
    var invokedDidFailRetrieveRepositories = false
    var invokedDidFailRetrieveRepositoriesWithMessage = false
    
    func interactor(didRetrieveRepositories repositories: [RepositoryViewModel]) {
        invokedDidRetrieveRepositories = true
    }
    
    func interactor(didFailRetrieveRepositories error: Error) {
        invokedDidFailRetrieveRepositories = true
    }
    
    func interactor(didFailRetrieveRepositoriesWithMessage message: String) {
        invokedDidFailRetrieveRepositoriesWithMessage = true
    }
}
