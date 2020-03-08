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
    @IBOutlet weak var iCustomerId: UITextField!
    @IBOutlet weak var iFirstName: UITextField!
    @IBOutlet weak var iLastName: UITextField!
    @IBOutlet weak var iEmail: UITextField!
    @IBOutlet weak var iMobile: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func iSave(_ sender: UIBarButtonItem) {
        let customerId = self.iCustomerId.text
        let firstName = self.iFirstName.text
        let lastName = self.iLastName.text
        let email = self.iEmail.text
        let mobile = self.iMobile.text
        guard let key = self.ref.child("Users").childByAutoId().key else {return}
        let insert = ["id": customerId, "firstName": firstName, "lastName": lastName, "email": email?.emailValidation(), "mobile": mobile?.mobileNumberValidation()]
        
            if customerId == "" || firstName == ""
                {
                    print("if")
                    let alertControll = UIAlertController(title: "Error!", message: "Required Customer Id and First Name", preferredStyle: .alert)
                               alertControll.addAction(UIAlertAction(title: "Ok", style: .default))
                               self.present(alertControll, animated: true, completion: nil)
                }else{
                    print("else")
                    let childUpdates = ["/Users/\(key)": insert]
                    self.ref.updateChildValues(childUpdates)
                    let sb = UIStoryboard(name: "Main", bundle: nil)
                    let secondVC = sb.instantiateViewController(identifier: "customerTableListVC") as! CustomerListTableViewController
                    self.navigationController?.pushViewController(secondVC, animated: true)
                }

// force entry in database
        //let childUpdates = ["/Users/\(key)": insert]
        //ref.updateChildValues(childUpdates)
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
