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
        print(sc.profiles)
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
                if email == (sc.profiles.map({ $0.email }))[0] {
                    if password == (sc.profiles.map({ $0.password }))[0] {
                        UserDefaults.standard.set(true, forKey: "loggedIn")
                        sceneDelegate.setSecondRootController(windowScene: scene)
                    } else {
//                        showEmailErrorAlert()
                        print(email, password)
                    }
                } else {
//                    showPasswordErrorAlert()
                    print(password, email)
                }
            }
            
            
            
            //UserDefaults
            //Keychain - sensitive data (password, passcode, token, apiKey) - networking
        }
    }
    
    func showEmailErrorAlert() {
        let ac = UIAlertController(title: "Error", message: "Email is not correct or no account is exist", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OKAY", style: .default))
        present(ac, animated: true)
    }
    
    func showPasswordErrorAlert() {
        let ac = UIAlertController(title: "Error", message: "Password is incorrect.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OKAY", style: .default))
        present(ac, animated: true)
    }
    
    
    @IBAction func registerAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "\(RegisterController.self)") as! RegisterController
        present(vc, animated: true)
    }
    
}

