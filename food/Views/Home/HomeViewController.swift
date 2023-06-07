//
//  HomeViewController.swift
//  food
//
//  Created by MAG on 06/06/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var categoryCollectionView: UICollectionView!
    var categories: [DishesCategoryModel] = [
        .init(id: "id1",
              name: "AfricaDishes",
              image: "https://picsum.photos/100/200"),
        .init(id: "id1",
              name: "AfricaDishes",
              image: "https://picsum.photos/100/200"),
        .init(id: "id1",
              name: "AmircaDishes",
              image: "https://picsum.photos/100/200"),
        .init(id: "id1",
              name: "AfricaDishes",
              image: "https://picsum.photos/100/200"),
        .init(id: "id1",
              name: "EuropaDishes",
              image: "https://picsum.photos/100/200"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Food"

        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self

        registerCells()
    }

    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.idtentfier,
                                              bundle: nil),
                                        forCellWithReuseIdentifier: CategoryCollectionViewCell.idtentfier)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryModel = categories[indexPath.row]
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.idtentfier, for: indexPath) as! CategoryCollectionViewCell
        cell.setUp(category: categoryModel)
        return cell
    }




}
