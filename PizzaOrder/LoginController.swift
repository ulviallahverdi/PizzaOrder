//
//  ViewController.swift
//  PizzaOrder
//
//  Created by Ulvi Allahverdiyev on 25.06.23.
//

import UIKit
import Lottie

class LoginController: UIViewController, UITextFieldDelegate {
    
    
    
    let sc = StructureMain()
    @IBOutlet weak var emailField: UITextField!
    var profiles = [User]()
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sc.readFromJsonFile()
        passwordField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = scene.delegate as? SceneDelegate  {
            
            if let email = emailField.text, let password = passwordField.text {
                if email == (sc.profiles.map({ $0.email }))[0] && password == (sc.profiles.map({ $0.password }))[0] {
                        UserDefaults.standard.set(true, forKey: "loggedIn")
                        sceneDelegate.setSecondRootController(windowScene: scene)
                    } else {
                    showPasswordErrorAlert()
                }
            }
            
            
            
            //UserDefaults
            //Keychain - sensitive data (password, passcode, token, apiKey) - networking
        }
    }
    
    func showPasswordErrorAlert() {
        let ac = UIAlertController(title: "Error", message: "Username or Password is incorrect.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OKAY", style: .default))
        present(ac, animated: true)
    }
    
    
    @IBAction func registerAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "\(RegisterController.self)") as! RegisterController
        present(vc, animated: true)
    }
    
}

