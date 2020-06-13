//
//  RepoListInteractor.swift
//  StarsTop
//
//  Created by Samuel Furtado on 08/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

protocol RepoListInteractorProtocol: class {
    func viewDidLoad()
    func didSelectRow(at index: Int)
}

final class RepoListInteractor {
    
    private var presenter: RepoListInteractorOutputProtocol?
    private var worker: RepoListWorkerProtocol
    
    init(presenter: RepoListInteractorOutputProtocol, worker: RepoListWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
    
    //private let repositoryService = RepoListService()
    //private var repositories: [Repository] = []
    
    func viewDidLoad() {
        worker.getRepositories { (repositoryResponseTuple) in
            //business logic
        }
    }
    
    func didSelectRow(at index: Int) {
    }
    
}
