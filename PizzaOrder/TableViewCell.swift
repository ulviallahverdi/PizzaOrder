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
            print("Before",pizzaListIncrease)
            delegate?.buttonTapped(withData: pizzas?[ip.row].name ?? "")
            pizzaListIncrease.append(PizzaBasket(pizzaList: [Pizza(name: pizzas?[ip.row].name, price: pizzas?[ip.row].price, image: pizzas?[ip.row].image)], sousList: [], drinkList: []))
            print("after: ",pizzaListIncrease)

        }
        print("end:",pizzaListIncrease)
    }
    

    
}
