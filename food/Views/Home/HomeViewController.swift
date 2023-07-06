//
//  HomeViewController.swift
//  food
//
//  Created by MAG on 06/06/2023.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet var categoryCollectionView: UICollectionView!
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var chefsCollectionView: UICollectionView!

    var categoriesDishes: [DishesCategoryModel] = []
    var popularDishes: [DishModel] = []
    var specialsDishes: [DishModel] = []

    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Food"

        registerCells()

        ProgressHUD.show()
        NetworkServices.shared.fetchAllCategories{[weak self] (result) in

            switch result {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categoriesDishes = allDishes.categories ?? []
                self?.popularDishes = allDishes.populars ?? []
                self?.specialsDishes = allDishes.specials ?? []

                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.chefsCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        chefsCollectionView.delegate = self
        chefsCollectionView.dataSource = self


    }

    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.idtentfier,
                                              bundle: nil),
                                        forCellWithReuseIdentifier: CategoryCollectionViewCell.idtentfier)
        popularCollectionView.register(UINib(nibName: DishesPortriaCollectionViewCell.identifier,
                                              bundle: nil),
                                        forCellWithReuseIdentifier: DishesPortriaCollectionViewCell.identifier)
        chefsCollectionView.register(UINib(nibName: DishesLanscapeCollectionViewCell.identifier,
                                              bundle: nil),
                                        forCellWithReuseIdentifier: DishesLanscapeCollectionViewCell.identifier)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        switch collectionView{
        case categoryCollectionView:
            return categoriesDishes.count
        case popularCollectionView:
            return popularDishes.count
        case chefsCollectionView:
            return specialsDishes.count
        default:
            return 0
        }

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch collectionView {
        case categoryCollectionView:
            let categoryModel = categoriesDishes[indexPath.row]
            let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.idtentfier, for: indexPath) as! CategoryCollectionViewCell
            cell.setUp(category: categoryModel)
            return cell
        case popularCollectionView:
            let dishesModel = popularDishes[indexPath.row]

            let dishcell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: DishesPortriaCollectionViewCell.identifier, for: indexPath) as! DishesPortriaCollectionViewCell

            dishcell.setup(dishesModel)
            return dishcell
        case chefsCollectionView:
            let dishesModel = specialsDishes[indexPath.row]

            let dishcell = chefsCollectionView.dequeueReusableCell(withReuseIdentifier: DishesLanscapeCollectionViewCell.identifier, for: indexPath) as! DishesLanscapeCollectionViewCell
            dishcell.setUP(dishesModel)
            return dishcell
        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if collectionView == categoryCollectionView {
            let cotroller = DishListCategotyViewController.instantiante()
            cotroller.category = categoriesDishes[indexPath.row]
            navigationController?.pushViewController(cotroller, animated: true)
        }
        else {
            let controller = DishesDetailsViewController.instantiante()
            navigationController?.pushViewController(controller, animated: true)
            controller.dish = collectionView ==
            popularCollectionView ?
            popularDishes[indexPath.row] :
            specialsDishes[indexPath.row]
        }
    }


}
