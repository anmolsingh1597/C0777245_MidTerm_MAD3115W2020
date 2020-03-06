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
        guard let key = self.ref.child("Users").childByAutoId().key else { return }
        let insert = ["userName": user,"password": password]
        let refer = self.ref.child("Users")
        refer.observeSingleEvent(of: .value, with: { (snapshot) in
        if let userDict = snapshot.value as? [String:[String:String]]{
        if userDict.values.contains(insert as! [String: String]){
        print("User exist")
        }else{
// values inserted successfully
        let childUpdates = ["/Users/\(key)": insert]
        self.ref.updateChildValues(childUpdates)
        }
    }
})

}
}
