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

struct drinkBasket: Codable {
    var drinkList: [Drink]
}

class BasketController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        readSousFromBasket()
        readPizzaBasketFromJson()
        readDrinkFromBasket()
        collectionView.register(UINib(nibName: "BasketCollectionViewCell", bundle: Bundle(identifier: "BasketCollectionViewCell")), forCellWithReuseIdentifier: "BasketCollectionViewCell")
        collectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        readSousFromBasket()
        readPizzaBasketFromJson()
        readDrinkFromBasket()
        collectionView.register(UINib(nibName: "BasketCollectionViewCell", bundle: Bundle(identifier: "BasketCollectionViewCell")), forCellWithReuseIdentifier: "BasketCollectionViewCell")
        // Do any additional setup after loading the view.
    }
    
    
    // UIVIEW Collection START
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        basket.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BasketCollectionViewCell", for: indexPath) as! BasketCollectionViewCell
        cell.itemName.text = basket[indexPath.item].pizzaList[0].name
        cell.itemPrice.text = "\(basket[indexPath.item].pizzaList[0].price ?? 0)"
        return cell
    }
    
    
    
    
    // UIVIEW Collection END
    
    
    
    
    
//    var pizzaListIncrease = [PizzaBasket]()
    var basket = [PizzaBasket]()
    func readPizzaBasketFromJson() {
        do {
            let data = try Data(contentsOf: getFilePathForBasket())
            basket = try JSONDecoder().decode([PizzaBasket].self, from: data)
        } catch {
                
        }
    }
    
    func getFilePathForBasket() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectory = paths[0]
//        let path = docDirectory.appending(component: "Basket.json")
        let path = docDirectory.appendingPathComponent("Basket.json")
       
        
        return path
    }
    
    // SOUS CALLING
    
    var sousBasket = SousBasket(sousList: [Sous]())
    
    func filePathForSous() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docuDirectory = paths[0]
        let path = docuDirectory.appending(path: "SousBasket.json")
        return path
    }
    
    func readSousFromBasket() {
        do {
            let data = try Data(contentsOf: filePathForSous())
            sousBasket = try JSONDecoder().decode(SousBasket.self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // SOUS CALLING END
    
    func filePathForDrink() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docuDirectory = paths[0]
        let path = docuDirectory.appending(path: "drink.json")
        return path
    }
    
    var drinkList = drinkBasket(drinkList: [Drink]())
    
    func readDrinkFromBasket() {
        do {
            let data = try Data(contentsOf: filePathForDrink())
            drinkList = try JSONDecoder().decode(drinkBasket.self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    // Ful summary ofthe items result for section for basket
    
    // PLAN 1 - To make UI Collection
    
    
    
    


}
