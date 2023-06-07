//
//  CategoryCollectionViewCell.swift
//  food
//
//  Created by MAG on 06/06/2023.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let idtentfier = String(describing: CategoryCollectionViewCell.self)
    @IBOutlet var categoryImage: UIImageView!
    @IBOutlet var categoryLabel: UILabel!

    func setUp(category: DishesCategoryModel){
        categoryImage.kf.setImage(with: category.image.asUrl)
        categoryLabel.text = category.name
    }

}
