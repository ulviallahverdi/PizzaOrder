//
//  TableViewCell.swift
//  PizzaOrder
//
//  Created by Ulvi Allahverdiyev on 02.07.23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var sekilView: UIImageView!
    
    @IBOutlet weak var buttonClicked: UIButton!
    @IBOutlet weak var pizzaAdi: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
