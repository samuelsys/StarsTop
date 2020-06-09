//
//  RepoListRouter.swift
//  StarsTop
//
//  Created by Samuel Furtado on 08/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

protocol RepoListRouterProtocol: class {
    var navigationController: UINavigationController? { get }
}

class RepoListRouter: RepoListRouterProtocol {
    weak var navigationController: UINavigationController?
}
