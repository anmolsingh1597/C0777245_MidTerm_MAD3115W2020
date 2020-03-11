//
//  ShowBillDetailsViewController.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-10.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class ShowBillDetailsViewController: UIViewController {
    var customerId: String?
    var firstName: String?
    var lastName: String?
    @IBOutlet weak var iCustomerId: UILabel!
    @IBOutlet weak var iFirstName: UILabel!
    @IBOutlet weak var iLastName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        iCustomerId.text = self.customerId
        iFirstName.text = self.firstName
        iLastName.text = self.lastName
    }
    
    @IBAction func iCustomers(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let customerVC = sb.instantiateViewController(identifier: "customerTableListVC") as! CustomerListTableViewController
        
        self.navigationController?.pushViewController(customerVC, animated: true)
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

