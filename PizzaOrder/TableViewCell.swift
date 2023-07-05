//
//  TableViewCell.swift
//  PizzaOrder
//
//  Created by Ulvi Allahverdiyev on 02.07.23.
//

import UIKit

protocol CustomPizzaViewCell: AnyObject {
    func buttonTapped(withData data: String)
}

struct PizzaBasket: Codable {
    var pizzaList: [Pizza]
    
}

class TableViewCell: UITableViewCell {
    
    let lc = PizzaController()
    
    @IBOutlet weak var sekilView: UIImageView!
    
    weak var delegate : CustomPizzaViewCell?
    var indexPath : IndexPath?
    var pizzas : [Pizza]?
    var pizzaListIncrease = [PizzaBasket]()
    
    @IBOutlet weak var pizzaAdi: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func plusClicked(_ sender: Any) {
        if let ip = indexPath {
            delegate?.buttonTapped(withData: pizzas?[ip.row].name ?? "")
            pizzaListIncrease.append(PizzaBasket(pizzaList: [Pizza(name: "yf", price: 34, image: "dfd")]))
            print(pizzaListIncrease)
        }
    }
    

    
}
