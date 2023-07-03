//
//  PizzaController.swift
//  PizzaOrder
//
//  Created by Ulvi Allahverdiyev on 25.06.23.
//

import UIKit

class PizzaController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let lc = StructureMain()
    @IBOutlet weak var table: UITableView!
    var pizzas = [Pizza]()
    
    func readPizzaFromJsonFile() {
        do {
            let data = try Data(contentsOf: lc.getFilePathForPizza())
            pizzas = try JSONDecoder().decode([Pizza].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pizzas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.pizzaAdi.text = pizzas[indexPath.item].name
        cell.sekilView.image = UIImage(named: "\(pizzas[indexPath.item].image ?? "noimage")")
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        print(lc.getFilePathForPizza())
        lc.writeToJsonFileForPizza()
        readPizzaFromJsonFile()
        table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // Hücreler arasındaki boşluk yüksekliği
    }
    
    


}
