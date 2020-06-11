//
//  RepoListModels.swift
//  StarsTop
//
//  Created by Samuel Furtado on 08/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation

typealias RepositoryViewModel = RepoList.Models.ViewModel

//MARK: - View Models

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

// MARK: - Encodable Models

struct Repository: Decodable {
   
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case items
    }
}

struct Item: Decodable {
   
    let name: String
    let owner: Owner
    let stars: Int

    enum CodingKeys: String, CodingKey {
        case name
        case owner
        case stars = "stargazers_count"
    }
}

struct Owner: Decodable {
   
    let login: String
    let avatarUrl: String

    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}
