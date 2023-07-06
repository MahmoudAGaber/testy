//
//
//  DishesCategoryModel.swift
//  food
//
//  Created by MAG on 06/06/2023.
//

import Foundation


struct DishesCategoryModel: Decodable{
    let id, name, image: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}

