//
//  AppError.swift
//  food
//
//  Created by MAG on 18/06/2023.
//

import Foundation

enum AppError: Error{
    case errorDecoding
    case unknownError
    case invaildUrl
    case serverError(String)

    var errorDescription: String {
        switch self {
        case .errorDecoding:
            return "Response not be to code"
        case .unknownError:
            return "I have no idea what go on"
        case .invaildUrl:
            return "Get me a vaild Url"
        case .serverError(let error):
            return error
        }
    }
}
