//
//  OrderListViewController.swift
//  food
//
//  Created by MAG on 14/06/2023.
//

import UIKit
import ProgressHUD

class OrderListViewController: UIViewController {

    var orders: [OrderModel] = []


    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        registerTableViewCell()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        ProgressHUD.show()
    }

    override func viewDidAppear(_ animated: Bool) {
        NetworkServices.shared.orders(){[weak self] (result) in

            switch result {

            case .success(let orders):
                ProgressHUD.dismiss()
                self?.orders = orders
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }

    private func registerTableViewCell(){
        tableView.register(UINib(nibName: OrderListTableViewCell.indentifier,
                                 bundle: nil),
                           forCellReuseIdentifier: OrderListTableViewCell.indentifier)
    }

}

extension OrderListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let model = orders[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderListTableViewCell.indentifier, for: indexPath) as! OrderListTableViewCell
        cell.setUp(model)
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishesDetailsViewController.instantiante()
        controller.dish = orders[indexPath.row].dish

        navigationController?.pushViewController(controller, animated: true)
    }
}
