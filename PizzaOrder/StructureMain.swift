//
//  StructureMain.swift
//  PizzaOrder
//
//  Created by Ulvi Allahverdiyev on 28.06.23.
//

import UIKit

struct User : Codable {
    let name : String?
    let surname: String?
    let email : String?
    let password: String?
}
let lc = RegisterController()


class StructureMain: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var profiles = [User]()


    func readFromJsonFile() {
        do {
            let data = try Data(contentsOf: getFilePath())
            profiles = try JSONDecoder().decode([User].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }

    func getFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDicrectory = paths[0]
        let path = docDicrectory.appending(component: "Users.json")
        return path
    }

    func writeToJSonFile() {
        do {
            let data =  try JSONEncoder().encode(profiles)
            try data.write(to: getFilePath())
        } catch {
            print(error.localizedDescription)
        }
    }


}
