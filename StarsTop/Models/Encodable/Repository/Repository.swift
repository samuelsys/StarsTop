//
//  Repository.swift
//  StarsTop
//
//  Created by Samuel Furtado on 14/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

struct Repository: Decodable {
   
    let items: [Item]?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case items
        case message
    }
}
