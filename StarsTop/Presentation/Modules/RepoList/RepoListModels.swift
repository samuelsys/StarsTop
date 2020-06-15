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

extension RepositoryViewModel: Equatable {
    static func == (lhs: RepositoryViewModel, rhs: RepositoryViewModel) -> Bool {
      return lhs.name == rhs.name &&
              lhs.stars == rhs.stars &&
              lhs.photo == rhs.photo &&
              lhs.author == rhs.author
    }
}
