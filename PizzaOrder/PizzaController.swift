//
//  PizzaController.swift
//  PizzaOrder
//
//  Created by Ulvi Allahverdiyev on 25.06.23.
//

import UIKit

class PizzaController: UIViewController, UITableViewDataSource, UITableViewDelegate, CustomPizzaViewCell {
    
    
    
    func buttonTapped(withData data: String) {
        table.reloadData()
    }
    
    
    @IBOutlet weak var button: UIButton!
    let lc = StructureMain()
    
    
    var basket = [PizzaBasket]()
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pizzas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.delegate = self
        cell.indexPath = indexPath
        cell.pizzaAdi.text = pizzas[indexPath.item].name
        cell.pizzas = pizzas
        readPizzaBasketFromJson()
        let count = basket.reduce(0) { result, pizzaBasket in
            result + pizzaBasket.pizzaList.filter { $0.name == pizzas[indexPath.item].name }.count
        }
        cell.orderCount.text = "\(count)"
        cell.sekilView.image = UIImage(named: "\(pizzas[indexPath.item].image ?? "noimage")")
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        print(lc.getFilePathForPizza())
        lc.writeToJsonFileForPizza()
        readPizzaFromJsonFile()
        print("came to PizzaController")
        button.addTarget(self, action: #selector(goToSousTab()), for: .touchUpInside)
        table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewwillDisappear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewwillappear")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // Hücreler arasındaki boşluk yüksekliği
    }
    
    @objc private func goToSousTab() {
            // Get the reference to the tab bar controller
        guard let tabBarVC = tabBarController else { return }

            // Set the selected index to switch to the "Sous" tab
            tabBarVC.selectedIndex = 2
        }
    

    @IBAction func continueToSousSelection(_ sender: Any) {
        
            
    }
    
                         


}
