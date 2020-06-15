//
//  RepoListDetailCellTests.swift
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
class RepoListDetailCellSpec: QuickSpec {
    
    override func spec() {
        
        describe("A RepoListDetailCell") {
            
            context("After setup a RepoListDetail Cell with viewModel") {
                
                let repoListDetailCell = RepoListDetailCell()
                         
                let viewModel = RepositoryViewModel(name: "repo1",
                                                   stars: 5,
                                                   photo: "https://avatars0.githubusercontent.com/u/43388?v=4",
                                                   author: "author")
               
               repoListDetailCell.setup(with: viewModel)

                it("should have name, stars, photo and author set in cell UI attributes") {
                    
                    expect(repoListDetailCell.photoImageView).toNot(beNil())
                    expect(repoListDetailCell.authorNameLabel.text).to(equal("author"))
                    expect(repoListDetailCell.repoNameLabel.text).to(equal("repo1"))
                    expect(repoListDetailCell.starsNumberLabel.text).to(equal("5"))
                }
            }
           
        }
    }
}
