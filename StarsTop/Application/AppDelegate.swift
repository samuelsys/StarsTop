//
//  AppDelegate.swift
//  StarsTop
//
//  Created by Samuel Furtado on 08/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        let initialAppViewController = RepoListViewController()
        ArchConfiguratorFactory.configureInitialArchFlow(decoder: RepoListConfigurator.self, viewController: initialAppViewController)
        window = WindowFactory.make(withViewController: initialAppViewController)
    }
}
