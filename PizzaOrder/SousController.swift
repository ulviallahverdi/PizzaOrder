//
//  SousController.swift
//  PizzaOrder
//
//  Created by Ulvi Allahverdiyev on 25.06.23.
//

import UIKit

class SousController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var sousList = [Sous]()
    var basketList = [PizzaBasket]()
    var pizzas = [Pizza]()
    var sousBasket = SousBasket(sousList: [Sous]())
    
    let pizzaControllerCall = PizzaController()
    
    func getFilePathforSous() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDicrectory = paths[0]
        let path = docDicrectory.appendingPathComponent("SousBasket.json")
        return path
    }
    
    func writeToSousBasketJSonFile() {
        do {
            let data =  try JSONEncoder().encode(sousBasket)
            try data.write(to: getFilePathforSous())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    
//    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
//        CGSize(width: CGFloat(20), height: CGFloat(20))
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(filePath())
        pizzaControllerCall.readPizzaFromJsonFile()
        sousList.append(Sous(name: "Moyonez", price: 1))
        sousList.append(Sous(name: "Ketcup", price: 2))
        writeToSousBasketJSonFile()
//        writeToSousJsonFile()
        
//        readFromSousListFromJsonFile()
        
        // Do any additional setup after loading the view.
    }
    
    func filePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docuDirectory = paths[0]
        let path = docuDirectory.appending(path: "sous.json")
        return path
    }
    
    
    
    func writeToSousJsonFile() {
        do {
            let data = try JSONEncoder().encode(sousBasket)
            try data.write(to: filePath())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readFromSousListFromJsonFile() {
        do {
            let data = try Data(contentsOf: filePath())
            sousList = try JSONDecoder().decode([Sous].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sousList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SousCollectionViewCell", for: indexPath) as! SousCollectionViewCell
        cell.textLabel.text = sousList[indexPath.item].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // Update the yaziLabel of the selected cell
            if let cell = collectionView.cellForItem(at: indexPath) as? SousCollectionViewCell {
                
                if cell.yaziLabel.text == "+" {
                    cell.yaziLabel.text = "Add"
                    sousBasket.sousList.remove(at: indexPath.item)

                    
                    writeToSousBasketJSonFile()
                } else {
                    cell.yaziLabel.text = "+"
                    print(sousList[indexPath.item].name)
                    sousBasket.sousList.append(Sous(name: sousList[indexPath.item].name, price: sousList[indexPath.item].price))
                    writeToSousBasketJSonFile()
                }
            }
    }
    
    
    
}
