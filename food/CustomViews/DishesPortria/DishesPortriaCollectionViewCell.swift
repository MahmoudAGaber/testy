//
//  DishesPortriaCollectionViewCell.swift
//  food
//
//  Created by MAG on 08/06/2023.
//

import UIKit

class DishesPortriaCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DishesPortriaCollectionViewCell.self)

    @IBOutlet var dishTitle: UILabel!
    @IBOutlet var dishImageView: UIImageView!
    @IBOutlet var dishColorias: UILabel!
    @IBOutlet var dishDescription: UILabel!


    func setup(_ dish: DishModel){
        dishTitle.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        dishColorias.text = dish.formateCalories
        dishDescription.text = dish.description
    }


}
