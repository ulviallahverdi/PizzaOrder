//
//  RegisterController.swift
//  PizzaOrder
//
//  Created by Ulvi Allahverdiyev on 25.06.23.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var profiles = [User]()
    let sc = StructureMain()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        sc.readFromJsonFile()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func registerAction(_ sender: Any) {
        if let name = nameField.text, let email = emailField.text,
           let surname = surnameField.text, let password = passwordField.text {
            sc.profiles.append(User(name: name, surname: surname, email: email, password: password))
//            sc.readFromJsonFile()
            sc.writeToJSonFile()
        } else {
            print("something wrong")
        }
    }
    
    

}
