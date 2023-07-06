//
//  File.swift
//  food
//
//  Created by MAG on 05/06/2023.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRaduis: CGFloat {
        get { return cornerRaduis }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
