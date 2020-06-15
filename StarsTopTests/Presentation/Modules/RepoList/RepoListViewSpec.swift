//
//  RepoListViewSpec.swift
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
class RepoListViewSpec: QuickSpec {
    
    override func spec() {
        
        describe("A RepoListView") {
            
            context("After init without arguments") {
                
                let repoListView = RepoListView()
                
                it("should have table view set") {
                    expect(repoListView.tableView).toNot(beNil())
                }
                
                it("should have refresh control set on table view") {
                    expect(repoListView.tableView.refreshControl).toNot(beNil())
                }
                
                it("should have loading activity indicator") {
                    expect(repoListView.loadingView).toNot(beNil())
                }
                
            }
           
        }
    }
}
