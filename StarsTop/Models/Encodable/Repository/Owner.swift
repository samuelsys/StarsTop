//
//  Owner.swift
//  StarsTop
//
//  Created by Samuel Furtado on 14/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

struct Owner: Decodable {
   
    let login: String
    let avatarUrl: String

    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}
