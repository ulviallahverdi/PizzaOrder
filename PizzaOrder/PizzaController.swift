//
//  PizzaController.swift
//  PizzaOrder
//
//  Created by Ulvi Allahverdiyev on 25.06.23.
//

import UIKit

class PizzaController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collection: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PizzaCollectionViewCell", for: indexPath) as! PizzaCollectionViewCell

        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.register(UINib(nibName: "PizzaCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PizzaCollectionViewCell")
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let itemWidth = width/2
        let itemHeight: CGFloat = 100
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftInset: CGFloat = 0 // Sol iç kenarlık
            let rightInset: CGFloat = 150 // Sağ iç kenarlık
            let topInset: CGFloat = 0 // Üst iç kenarlık
            let bottomInset: CGFloat = 0 // Alt iç kenarlık
            
            return UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // Satır aralığı
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // Sütun aralığı
    }

    

}
