//
//  OrderListTableViewCell.swift
//  food
//
//  Created by MAG on 14/06/2023.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {

    static let indentifier = String(describing: OrderListTableViewCell.self)

    @IBOutlet var orderImage: UIImageView!
    @IBOutlet var orderName: UILabel!
    @IBOutlet var orderDescription: UILabel!

    func setUp(_ order: OrderModel){
        orderImage.kf.setImage(with: order.dish?.image?.asUrl)
        orderName.text = order.name
        orderDescription.text = order.dish?.description
    }
}
