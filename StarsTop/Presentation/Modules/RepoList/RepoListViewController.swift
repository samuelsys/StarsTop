//
//  RepoListViewController.swift
//  StarsTop
//
//  Created by Samuel Furtado on 08/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

protocol RepoListPresenterOutputProtocol: class {
    func presenter(didRetrieveItems items: [RepositoryViewModel])
    func presenter(didFailRetrieveItems error: Error)
    func presenter(didFailRetrieveItemsWithMessage message: String)
}

final class RepoListViewController: UIViewController, RepoListPresenterOutputProtocol {
    
    // MARK: - Properties
    var repoListView: RepoListView?
    var interactor: RepoListInteractor?
    var router: RepoListRouter?
    
    var currentPage = 1
    var itemsUpdated = false
    
    private var items: [RepositoryViewModel] = [] {
        didSet {
            repoListView?.tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        self.view = repoListView
        
        repoListView?.tableView.delegate = self
        repoListView?.tableView.dataSource = self
        repoListView?.refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.loadRepositories(page: currentPage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Repositories"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        repoListView?.loadingView.startAnimating()
    }
    
    @objc private func refreshWeatherData(_ sender: Any) {
        currentPage = 1
        repoListView?.loadingView.stopAnimating()
        interactor?.loadRepositories(page: currentPage)
    }
    
    // MARK: - RepoPresenterOutputProtocol conforms
    
    func presenter(didRetrieveItems items: [RepositoryViewModel]) {
        asyncFinished(withSuccess: true, title: nil, message: nil)
        currentPage == 1 ? self.items = items : self.items.append(contentsOf: items)
        repoListView?.refreshControl.endRefreshing()
    }
    
    func presenter(didFailRetrieveItems error: Error) {
        asyncFinished(withSuccess: false, title: "Ops", message: "Não foi possível carregar os dados")
    }
    
    func presenter(didFailRetrieveItemsWithMessage message: String) {
        asyncFinished(withSuccess: false, title: "Ops", message: message)
    }
    
    // MARK: - Private functions
    
    private func asyncFinished(withSuccess: Bool, title: String? , message: String?) {
        stopLoading()
        itemsUpdated = withSuccess
        
        if let title = title, let message = message {
            displayAlert(title: title, message: message)
        }
    }
    
    private func startLoading() {
        repoListView?.loadingView.startAnimating()
    }
    
    private func stopLoading() {
        repoListView?.loadingView.stopAnimating()
    }
    
    private func displayAlert(title: String, message: String) {
      
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      
        alert.addAction((UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            alert.dismiss(animated: true, completion: nil)
        })))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableView DataSource & Delegate

extension RepoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.size.height {
            currentPage = itemsUpdated ? currentPage + 1 : currentPage
            repoListView?.loadingView.startAnimating()
            interactor?.loadRepositories(page: currentPage)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? RepoListDetailCell else {
            return UITableViewCell()
        }
        cell.setup(with: items[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.interactor?.didSelectRow(at: indexPath.row)
    }
}
