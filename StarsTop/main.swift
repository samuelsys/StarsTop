//
//  main.swift
//  StarsTop
//
//  Created by Samuel Furtado on 09/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import func Foundation.NSStringFromClass
import func Foundation.NSClassFromString
import func UIKit.UIApplicationMain

let isRunningTests = NSClassFromString("XCTestCase") != nil


let testAppDelegate = "StarsTopTests.TestAppDelegate"
let appDelegateClass = isRunningTests ? testAppDelegate : NSStringFromClass(AppDelegate.self)

//let appDelegateClass = isRunningTests ? NSStringFromClass(TestAppDelegate.self) : NSStringFromClass(AppDelegate.self)

_ = UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, appDelegateClass)
