//
//  ProfileController.swift
//  PizzaOrder
//
//  Created by Ulvi Allahverdiyev on 25.06.23.
//

import UIKit

class ProfileController: UIViewController {
    
    let sc = StructureMain()
    let profiles = [User]()
    
    @IBOutlet weak var historyOrders: UILabel!
    @IBOutlet weak var emailField: UILabel!
    @IBOutlet weak var surnameField: UILabel!
    @IBOutlet weak var nameField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sc.readFromJsonFile()
        sc.readUserDataFromJsonFile(email: UserDefaults.standard.string(forKey: "loggedEmail") ?? "")
        emailField.text = "E-mail: " + (sc.profile[0].email ?? "")
        nameField.text = "Name: " + (sc.profile[0].name ?? "")
        surnameField.text = "Surname: " + (sc.profile[0].surname ?? "")
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = scene.delegate as? SceneDelegate {
            sceneDelegate.setLoginRootController(windowScene: scene)
            UserDefaults.standard.set(false, forKey: "loggedIn")
            //UserDefaults
            //Keychain - sensitive data (password, passcode, token, apiKey) - networking
        }
    }
    
    

}
