//
//  WindowFactory.swift
//  StarsTopTests
//
//  Created by Samuel Furtado on 09/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

enum WindowFactory {
    static func make() -> UIWindow {
        let window = UIWindow()
        window.backgroundColor = .white
        window.rootViewController = UINavigationController(rootViewController: UIViewController())
        window.makeKeyAndVisible()
        return window
    }
}

