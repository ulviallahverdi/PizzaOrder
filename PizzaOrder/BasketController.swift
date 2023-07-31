//
//  BasketController.swift
//  PizzaOrder
//
//  Created by Ulvi Allahverdiyev on 25.06.23.
//

import UIKit

struct Sous: Codable {
    let name: String
    let price : Int
}

struct Drink: Codable {
    let name: String
    let price: Int
}

struct PizzaBasket: Codable {
    var pizzaList: [Pizza]
}

struct SousBasket: Codable {
    var sousList: [Sous]
}

class BasketController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var pizzaListIncrease = [PizzaBasket]()
    
    


}
