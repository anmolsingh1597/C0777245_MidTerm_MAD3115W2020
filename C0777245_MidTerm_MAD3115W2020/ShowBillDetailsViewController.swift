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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
extension ShowBillDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "individualCustomerCell", for: indexPath) as! CustomerTableViewCell
                
        cell.iFirstNameViewCell.text = self.firstName
        cell.iLastNameViewCell.text = self.lastName
        cell.iCustomerIdViewCell.text = self.customerId
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return CGFloat(100.0)
    }
     
    func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }

    
}
