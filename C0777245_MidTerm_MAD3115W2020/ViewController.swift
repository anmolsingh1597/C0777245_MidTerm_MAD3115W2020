//
//  ViewController.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-06.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    var ref = Database.database().reference()
    @IBOutlet weak var iPassword: UITextField!
    @IBOutlet weak var iUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func iLogin(_ sender: UIBarButtonItem) {
        let user = self.iUserName.text
        let password = self.iPassword.text
        
        // To input data in Firebase
        
//        guard let key = self.ref.child("Logins").childByAutoId().key else { return }
//        let insert = ["userName": user,"password": password]
//        let refer = self.ref.child("Logins")
//        refer.observeSingleEvent(of: .value, with: { (snapshot) in
//        if let userDict = snapshot.value as? [String:[String:String]]{
//        if userDict.values.contains(insert as! [String: String]){
//        print("User exist")
//        }else{
//// values inserted successfully
//        let childUpdates = ["/Logins/\(key)": insert]
//        self.ref.updateChildValues(childUpdates)
//        }
//    }
//})
        let refer = self.ref.child("Logins")
        refer.observeSingleEvent(of: .value, with: { (snapshot) in
        if let userDict = snapshot.value as? [String:[String:String]] {
            print(userDict.values)
        let loginData = ["userName": user, "password": password]
        if userDict.values.contains(loginData as! [String : String]){
            print("It worked")
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let secondVC = sb.instantiateViewController(identifier: "customerTableListVC") as! CustomerListTableViewController
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
        else{
           let alertControll = UIAlertController(title: "Log In Failed", message: "Invalid User-name and Password ", preferredStyle: .alert)
            alertControll.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alertControll, animated: true, completion: nil)
            }
}
        }
        )
        
    }
    
}
