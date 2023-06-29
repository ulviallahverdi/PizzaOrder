//
//  ProfileController.swift
//  PizzaOrder
//
//  Created by Ulvi Allahverdiyev on 25.06.23.
//

import UIKit

class ProfileController: UIViewController {
    
    let sc = StructureMain()

    override func viewDidLoad() {
        super.viewDidLoad()
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
