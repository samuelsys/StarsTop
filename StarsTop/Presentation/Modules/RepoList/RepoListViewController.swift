//
//  RepoListViewController.swift
//  StarsTop
//
//  Created by Samuel Furtado on 08/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

protocol RepoListPresenterOutputProtocol: class {
    func presenter(didRetrieveItems items: [String])
    func presenter(didFailRetrieveItems message: String)
}

final class RepoListViewController: UIViewController, RepoListPresenterOutputProtocol {
    
    // MARK: - Properties
    var repoListView: RepoListView?
    var interactor: RepoListInteractor?
    var router: RepoListRouter?
    
    private var items: [String] = []
    
    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        self.view = repoListView
        
        repoListView?.tableView.delegate = self
        repoListView?.tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Repositories"
    }
    
    // MARK: - RepoPresenterOutputProtocol conforms
    
    func presenter(didRetrieveItems items: [String]) {
    }
    
    func presenter(didFailRetrieveItems message: String) {
    }
    
}

// MARK: - UITableView DataSource & Delegate

extension RepoListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = self.items[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.interactor?.didSelectRow(at: indexPath.row)
    }
}
