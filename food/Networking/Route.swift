//
//  Route.swift
//  food
//
//  Created by MAG on 15/06/2023.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    case fecthAllCategories
    case placeOrder(String)
    case dishCategory(String)
    case orders

    var description: String {
        switch self {
        case .fecthAllCategories:
            return "/dish-categories"
        case .placeOrder(let dishId):
            return "/orders/\(dishId)"
        case .dishCategory(let categoryId):
            return "/dishes/\(categoryId)"
        case .orders:
            return "/orders"
        }
    }
}
