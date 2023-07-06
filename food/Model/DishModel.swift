//
//  DishModel.swift
//  food
//
//  Created by MAG on 08/06/2023.
//

import Foundation

struct DishModel: Decodable {
    let id, name, description, image: String?
    let calorias: Int?

    var formateCalories: String{
        return "\(calorias ?? 0) calories"
    }
}
