//
//  SousController.swift
//  PizzaOrder
//
//  Created by Ulvi Allahverdiyev on 25.06.23.
//

import UIKit

class SousController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var sousList = [Sous]()
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(filePath())
        sousList.append(Sous(name: "Moyonez", price: 1))
        sousList.append(Sous(name: "Ketcup", price: 2))
        writeToSousJsonFile()
        readFromSousListFromJsonFile()
        
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
            let data = try JSONEncoder().encode(sousList)
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


    //call SouCollectionViewCell
    let scvc = SousCollectionViewCell()

    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        checkTick.image = UIImage(named: "pizza")
        scvc.checkTick?.text = "Checked"
    }
    
}
