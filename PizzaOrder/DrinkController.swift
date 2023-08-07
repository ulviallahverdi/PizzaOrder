//
//  DrinkController.swift
//  PizzaOrder
//
//  Created by Ulvi Allahverdiyev on 25.06.23.
//

import UIKit

class DrinkController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var drinks = drinkBasket(drinkList: [Drink]())
    
    func filePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docuDirectory = paths[0]
        let path = docuDirectory.appending(path: "drink.json")
        return path
    }
    
    
    
    func writeToDrinkJsonFile() {
        do {
            let data = try JSONEncoder().encode(drinks)
            try data.write(to: filePath())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(UINib(nibName: "DrinkCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DrinkCollectionViewCell")
        // Do any additional setup after loading the view.
        drinks.drinkList.append(Drink(name: "Kola", price: 5))
        drinks.drinkList.append(Drink(name: "Ayran", price: 2))
        writeToDrinkJsonFile()
        print(filePath())
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        drinks.drinkList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DrinkCollectionViewCell", for: indexPath) as! DrinkCollectionViewCell
        cell.drinkName.text = drinks.drinkList[indexPath.item].name
        cell.drinkSelected.text = "Not Selected"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? DrinkCollectionViewCell {
            
            cell.drinkSelected.text = "Selected"
        }
        showAlert()
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Added to basket", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
        


}
