//
//  DishesDetailsViewController.swift
//  food
//
//  Created by MAG on 13/06/2023.
//

import UIKit
import ProgressHUD

class DishesDetailsViewController: UIViewController {

    @IBOutlet var disheImage: UIImageView!
    @IBOutlet var disheName: UILabel!
    @IBOutlet var disheCalories: UILabel!
    @IBOutlet var disheDescription: UILabel!
    @IBOutlet var textFieldName: UITextField!

    var dish: DishModel?



    override func viewDidLoad() {
        super.viewDidLoad()

        populateView()
    }

    private func populateView(){
        disheImage.kf.setImage(with: dish?.image?.asUrl)
        disheName.text = dish?.name
        disheCalories.text = dish?.formateCalories
        disheDescription.text = dish?.description
    }

    @IBAction func placeOrderBtnClicked(_ sender: Any) {
        guard let name = textFieldName.text?.trimmingCharacters(in: .whitespaces),
              !name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
        }

        ProgressHUD.show("Placing order...")
        NetworkServices.shared.placeOrder(dishId: dish?.id ?? "",name: name){ (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSucceed("Your Order has been received")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }

}
