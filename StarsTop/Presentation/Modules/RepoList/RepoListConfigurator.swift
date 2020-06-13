//
//  RepoListConfigurator.swift
//  StarsTop
//
//  Created by Samuel Furtado on 08/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class RepoListConfigurator: ArchConfiguratorProtocol {
        
    static func configureModule(configuratorModel: ArchConfiguratorModel) {
        let view = RepoListView()
        
        let router = RepoListRouter()
          
        let worker = RepoListWorker(client: configuratorModel.clientRequest)
        
        let presenter = RepoListPresenter()
        
        let interactor = RepoListInteractor(presenter: presenter, worker: worker)
        
        if let repoViewController = configuratorModel.viewController as? RepoListViewController {
            repoViewController.repoListView = view
            repoViewController.router = router
            repoViewController.interactor = interactor
            
            presenter.viewController = repoViewController
            
            router.navigationController = configuratorModel.viewController.navigationController
        }
    }
}
