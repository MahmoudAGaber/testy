//
//  DishListCategotyViewController.swift
//  food
//
//  Created by MAG on 13/06/2023.
//

import UIKit
import ProgressHUD

class DishListCategotyViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    var category: DishesCategoryModel!

    var dishes: [DishModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = category?.name

        tableView.delegate = self
        tableView.dataSource = self

        registerTableViewCell()

        ProgressHUD.show()
        NetworkServices.shared.dishCategory(categoryId: category.id ?? ""){[weak self] (result) in
            switch result {

            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }

   private func registerTableViewCell(){
        tableView.register(UINib(nibName: dishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: dishListTableViewCell.identifier)
    }

}

extension DishListCategotyViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dishes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: dishListTableViewCell.identifier, for: indexPath) as! dishListTableViewCell

        cell.setUp(model)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishesDetailsViewController.instantiante()
        controller.dish = dishes[indexPath.row]

        navigationController?.pushViewController(controller, animated: true)
    }


}
