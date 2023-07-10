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
    let bc = BasketController()
    let sm = StructureMain()
    var basket = [PizzaBasket]()
    
    // NIB UI //
    
    
    @IBOutlet weak var orderCount: UILabel!
    
    // END NIB UI //
    
    // FUNCTIONS //
    
    func readPizzaBasketFromJson() {
        do {
            let data = try Data(contentsOf: getFilePathForBasket())
            basket = try JSONDecoder().decode([PizzaBasket].self, from: data)
        } catch {
                
        }
    }
    
    func writeToBasketJson() {
        do {
            let data = try JSONEncoder().encode(basket)
            try data.write(to: getFilePathForBasket())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getFilePathForBasket() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectory = paths[0]
//        let path = docDirectory.appending(component: "Basket.json")
        let path = docDirectory.appendingPathComponent("Basket.json")
        return path
    }
    
    
    // END FUNCTIONS //
    
    @IBOutlet weak var sekilView: UIImageView!
    
    weak var delegate : CustomPizzaViewCell?
    var indexPath : IndexPath?
    var pizzas = [Pizza]()
    
    @IBOutlet weak var pizzaAdi: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        print(getFilePathForBasket())
        // Initialization code
    }
    
    @IBAction func plusClicked(_ sender: Any) {
        if let ip = indexPath {
            readPizzaBasketFromJson()
            delegate?.buttonTapped(withData: pizzas[ip.row].name ?? "")
            basket.append(PizzaBasket(pizzaList: [Pizza(name: pizzas[ip.row].name, price: pizzas[ip.row].price, image: pizzas[ip.row].image)], sousList: [], drinkList: []))
            writeToBasketJson()
        }
    }
    
    
    @IBAction func minusClicked(_ sender: Any) {
        if let ip = indexPath {
            readPizzaBasketFromJson()
            let nameToFind = pizzas[ip.row].name
            let indices = basket.enumerated().compactMap { index, pizzaBasket in
                pizzaBasket.pizzaList.contains { $0.name == nameToFind } ? index : nil
            }
//            print(indices) // Output: [0, 1, 2, 3]
            
            let randomIndex = indices.randomElement()
            if let index = randomIndex {
                basket.remove(at: index)
            } else {
                print("No indices found for the specified pizza name")
            }
            writeToBasketJson()
            delegate?.buttonTapped(withData: pizzas[ip.row].name ?? "")
        }
    }
}
