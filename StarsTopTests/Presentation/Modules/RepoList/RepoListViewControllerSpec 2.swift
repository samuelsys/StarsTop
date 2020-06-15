//
//  RepoListViewController.swift
//  StarsTopTests
//
//  Created by Samuel Furtado on 14/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import StarsTop

// Testing the vehicle
class RepoListViewControllerSpec: QuickSpec {
    
    override func spec() {
        describe("A RepoListViewController") {
            
            let environment = Environment()
            
            context("After init RepoListViewController with success and stub delegate") {
                
                let worker = RepoListWorker(client: MockRequest(environment: environment))
                let viewController = RepoListViewController()
                let presenterOutput = RepoListViewControllerStub()
                
                setupViewController(viewController: viewController,
                                   presenterOutput: presenterOutput,
                                   worker: worker)
                
                _ = viewController.view
                
                it("first didRetrieveItems return item is awesome-ios") {
                        
                    let viewModel = RepositoryViewModel(name: "awesome-ios",
                                                        stars: 35064,
                                                        photo: "https://avatars2.githubusercontent.com/u/484656?v=4",
                                                        author: "vsouza")
                        
                    expect(presenterOutput.items).toEventually(contain(viewModel), timeout: 5)
                }
                
                it("didRetrieveItems should return 30 items") {
                    expect(presenterOutput.items?.count).toEventually(equal(30), timeout: 5)
                }
                
                it("should have a interactor, view and router set") {
                    expect(viewController.interactor).toNot(beNil())
                    expect(viewController.repoListView).toNot(beNil())
                    expect(viewController.router).toNot(beNil())
                }
            }
            
            context("After init RepoListViewController with Generic Error and mock delegate") {
                
                let viewController = RepoListViewController()
                let presenterOutput = RepoListViewControllerStub()
                
                setupViewController(viewController: viewController,
                                   presenterOutput: presenterOutput,
                                   worker: RepoListWorkerMockGenericError())
                
                _ = viewController.view
                
                it("error should not be nil") {
                    expect(presenterOutput.error).toNot(beNil())
                }
                
                it("didRetrieveItems must be nil") {
                    expect(presenterOutput.items).to(beNil())
                }
            }
            
            context("After init RepoListViewController with Message Error and mock delegate") {
                
                let viewController = RepoListViewController()
                let presenterOutput = RepoListViewControllerStub()
                
                setupViewController(viewController: viewController,
                                   presenterOutput: presenterOutput,
                                   worker: RepoListWorkerMockErrorWithMessage())
                
                _ = viewController.view
                
                it("error should not be nil") {
                    expect(presenterOutput.message).toNot(beNil())
                }
                
                it("didRetrieveItems must be nil") {
                    expect(presenterOutput.items).to(beNil())
                }
            }
            
            context("After init RepoListViewController with Success and Own delegate") {
                
                let viewController = RepoListViewController()
                let worker = RepoListWorker(client: MockRequest(environment: environment))
                
                setupViewController(viewController: viewController,
                                   presenterOutput: viewController,
                                   worker: worker)
                
                _ = viewController.view
                
                it("items should have 30 items") {
                    expect(viewController.items.count).toEventually(equal(30))
                }
                
                it("items Updated should be true") {
                    expect(viewController.itemsUpdated).to(beTrue())
                }
            }
            
            context("After init RepoListViewController with Generic Error and Own delegate") {
                
                let viewController = RepoListViewController()
                let worker = RepoListWorkerMockGenericError()
                
                setupViewController(viewController: viewController,
                                   presenterOutput: viewController,
                                   worker: worker)
                
                _ = viewController.view
                
                it("items should be nil") {
                    expect(viewController.items.count).toEventually(equal(0))
                }
                
                it("items Updated should be false") {
                    expect(viewController.itemsUpdated).to(beFalse())
                }
            }
        }
    }
    
    func setupViewController(viewController: RepoListViewController,
                            presenterOutput: RepoListPresenterOutputProtocol,
                            worker: RepoListWorkerProtocol) {
        
        let router = RepoListRouter()
        let view = RepoListView()
        let presenter = RepoListPresenter()
        presenter.viewController = presenterOutput
        
        let interactor = RepoListInteractor(presenter: presenter, worker: worker)
        
        viewController.interactor = interactor
        viewController.repoListView = view
        viewController.router = router
        
    }
}
