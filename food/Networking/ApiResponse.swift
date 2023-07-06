//
//  ApiResponse.swift
//  food
//
//  Created by MAG on 24/06/2023.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
