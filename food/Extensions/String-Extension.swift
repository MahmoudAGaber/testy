//
//  String-Extension.swift
//  food
//
//  Created by MAG on 07/06/2023.
//

import Foundation

extension String {
    var asUrl: URL?{
        return URL(string: self)
    }
}
