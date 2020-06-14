//
//  RepoListView.swift
//  StarsTop
//
//  Created by Samuel Furtado on 08/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

final class RepoListView: UIView {
    
    struct Constants {
        static let initNotImpementedError = "init(coder:) has not been implemented"
        
        struct TableView {
            static let rowHeight: CGFloat = 100.0
            static let cellIdentifier = "Cell"
        }
    }
    
    // MARK: - Properties
    
    let refreshControl = UIRefreshControl()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RepoListDetailCell.self, forCellReuseIdentifier: Constants.TableView.cellIdentifier)
        tableView.rowHeight = Constants.TableView.rowHeight
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var loadingView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.color = .blue
        return indicatorView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.initNotImpementedError)
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        backgroundColor = .white
        setupTableView()
        setupLoadingView()
        setupRefreshControl()
    }
    
    private func setupLoadingView() {
        addSubview(loadingView)
           
        NSLayoutConstraint.activate([
           loadingView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
           loadingView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func setupTableView() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    private func setupRefreshControl() {
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
    }
}
