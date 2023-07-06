//
//  UserDefaults+Extension.swift
//  food
//
//  Created by MAG on 05/07/2023.
//

import Foundation

extension UserDefaults {

    private enum UserDefaults: String {
        case hasOnBoarded
    }

    var hasOnBoerded: Bool {
        get{
            bool(forKey: UserDefaults.hasOnBoarded.rawValue)
        }

        set{
            setValue(newValue, forKey: UserDefaults.hasOnBoarded.rawValue)
        }
    }
}
