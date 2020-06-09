//
//  RepoListModels.swift
//  StarsTop
//
//  Created by Samuel Furtado on 08/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

typealias RepositoryViewModel = RepoList.Models.ViewModel

enum RepoList {
    struct Models {
        struct ViewModel {
            let name: String
            let stars: Int
            let photo: String
            let author: String
        }
    }
}
