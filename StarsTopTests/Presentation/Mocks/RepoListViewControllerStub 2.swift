//
//  RepoListViewControllerStub.swift
//  StarsTopTests
//
//  Created by Samuel Furtado on 14/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
@testable import StarsTop

class RepoListViewControllerStub: RepoListPresenterOutputProtocol {
    
    var items: [RepositoryViewModel]?
    var error: Error?
    var message: String?
    
    func presenter(didRetrieveItems items: [RepositoryViewModel]) {
        self.items = items
    }
    
    func presenter(didFailRetrieveItems error: Error) {
        self.error = error
    }
    
    func presenter(didFailRetrieveItemsWithMessage message: String) {
        self.message = message
    }
}
