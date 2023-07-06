//
//  DishesLanscapeCollectionViewCell.swift
//  food
//
//  Created by MAG on 10/06/2023.
//

import UIKit

class DishesLanscapeCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DishesLanscapeCollectionViewCell.self)

    @IBOutlet var dishImage: UIImageView!
    @IBOutlet var dishTitle: UILabel!
    @IBOutlet var dishDescription: UILabel!
    @IBOutlet var dishCalorie: UILabel!

    func setUP(_ dish: DishModel){
        dishImage.kf.setImage(with: dish.image?.asUrl)
        dishTitle.text = dish.name
        dishDescription.text = dish.description
        dishCalorie.text = dish.formateCalories
    }

}
