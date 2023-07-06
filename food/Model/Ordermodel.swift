//
//  Ordermodel.swift
//  food
//
//  Created by MAG on 14/06/2023.
//

import Foundation


struct OrderModel: Decodable {

    let id , name: String?
    let dish: DishModel?
}
