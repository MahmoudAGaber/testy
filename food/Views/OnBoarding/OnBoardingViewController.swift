//
//  OnBoardingViewController.swift
//  food
//
//  Created by MAG on 05/06/2023.
//

import UIKit

class OnBoardingViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextBtn: UIButton!

    var slides: [OnBoardingSlideModel] = []
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            }else{
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self

        slides.append(OnBoardingSlideModel(title: "Delicious Dishes",
                                           desc: "you want to eat come baby come...",
                                           image: UIImage(named: "slide1")!))
        slides.append(OnBoardingSlideModel(title: "World-class chefs",
                                           desc: "the best chefs cook i think you want to test food come now and order ...",
                                           image: UIImage(named: "slide2")!))
        slides.append(OnBoardingSlideModel(title: "Wide delivery",
                                           desc: "delive order anywhere you want and fast, orer now dont wait...",
                                           image: UIImage(named: "slide3")!))

        pageControl.numberOfPages = slides.count
    }

    @IBAction func NextBtnClicked(_ sender: Any) {

        if currentPage == slides.count - 1 {
            print("GO to next Page")
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnBoerded = true
            present(vc, animated: true)
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnBoardingViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        let slide = slides[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        cell.setup(slide)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }

}
