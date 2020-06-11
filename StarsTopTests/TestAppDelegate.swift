//
//  TestAppDelegate.swift
//  StarsTopTests
//
//  Created by Samuel Furtado on 10/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

final class TestAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = WindowFactory.make()
    }
    
}
