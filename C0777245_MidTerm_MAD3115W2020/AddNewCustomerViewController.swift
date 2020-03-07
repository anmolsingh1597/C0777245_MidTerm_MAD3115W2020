//
//  AddNewCustomerViewController.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-06.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
import Firebase

class AddNewCustomerViewController: UIViewController {
    var ref = Database.database().reference()
    @IBOutlet weak var iFirstName: UITextField!
    @IBOutlet weak var iLastName: UITextField!
    @IBOutlet weak var iEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func iSave(_ sender: UIBarButtonItem) {
        let firstName = self.iFirstName.text
        let lastName = self.iLastName.text
        let email = self.iEmail.text
        
        guard let key = self.ref.child("Users").childByAutoId().key else {return}
        let insert = ["id": key, "firstName": firstName, "lastName": lastName, "email": email]
        let childUpdates = ["/Users/\(key)": insert]
               ref.updateChildValues(childUpdates)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
