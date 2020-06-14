//
//  Item.swift
//  StarsTop
//
//  Created by Samuel Furtado on 14/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

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
