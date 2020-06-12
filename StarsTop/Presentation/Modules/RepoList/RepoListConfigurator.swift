//
//  RepoListConfigurator.swift
//  StarsTop
//
//  Created by Samuel Furtado on 08/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

class RepoListConfigurator {
    
    static func configureModule(viewController: RepoListViewController, environment: Environment) {
        let view = RepoListView()
        let router = RepoListRouter()
        
        let requestAlamofireApi = AlamofireApiRequest()
        let mockRequest = MockRequest()
        
        let api = RequestManager(environment: environment, apiRequest: requestAlamofireApi, mockRequest: mockRequest)
        let presenter = RepoListPresenter()
        
        let worker = RepoListWorker(api: api)
        let interactor = RepoListInteractor(presenter: presenter, worker: worker)
        
        viewController.repoListView = view
        viewController.router = router
        viewController.interactor = interactor
                
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
}
