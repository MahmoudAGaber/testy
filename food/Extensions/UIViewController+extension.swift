//
//  UIViewController+extension.swift
//  food
//
//  Created by MAG on 13/06/2023.
//

import Foundation
import UIKit

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }

    static func instantiante() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        return storyboard.instantiateViewController(identifier: identifier) as! Self
    }

}
