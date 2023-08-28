//
//  BasketCollectionViewCell.swift
//  PizzaOrder
//
//  Created by Ulvi Allahverdiyev on 07.08.23.
//

import UIKit

class BasketCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
}
