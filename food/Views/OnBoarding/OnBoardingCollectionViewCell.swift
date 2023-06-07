//
//  OnBoardingCollectionViewCell.swift
//  food
//
//  Created by MAG on 06/06/2023.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: OnBoardingCollectionViewCell.self)
    
    @IBOutlet var slideImageView: UIImageView!
    @IBOutlet var slideTitle: UILabel!
    @IBOutlet var slideDesc: UILabel!

    func setup(_ onBoaedingSlide: OnBoardingSlideModel){
        slideImageView.image = onBoaedingSlide.image
        slideTitle.text = onBoaedingSlide.title
        slideDesc.text = onBoaedingSlide.desc
    }
}
