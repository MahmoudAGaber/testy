//
//  dishListTableViewCell.swift
//  food
//
//  Created by MAG on 13/06/2023.
//

import UIKit

class dishListTableViewCell: UITableViewCell {

    static let identifier = String(describing: dishListTableViewCell.self)
    @IBOutlet var dishImage: UIImageView!
    @IBOutlet var dishName: UILabel!
    @IBOutlet var dishDescription: UILabel!

    func setUp(_ dish: DishModel){
        dishImage.kf.setImage(with: dish.image?.asUrl)
        dishName.text = dish.name
        dishDescription.text = dish.description
    }

}
