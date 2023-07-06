//
//  AllDishes.swift
//  food
//
//  Created by MAG on 26/06/2023.
//

import Foundation


struct AllDishes: Decodable {
    let categories: [DishesCategoryModel]?
    let populars: [DishModel]?
    let specials: [DishModel]?
}
