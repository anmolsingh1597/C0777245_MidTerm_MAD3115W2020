//
//  SecondViewController.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-06.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
import Firebase

class CustomerListTableViewController: UIViewController {
        @IBOutlet weak var iCustomerTable: UITableView!
        var ref = Database.database().reference()
        private static let instance = CustomerListTableViewController()
        //var firstNameArray: [String] = []
    var customerName: [Customer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customerName = DataStorage.getInstance().getAllCustomers()
        //DataStorage.getInstance().loadData()
    }
    static func getInstance() -> CustomerListTableViewController{
           return instance
       }
    
    
    @IBAction func iLogout(_ sender: UIButton) {
    self.navigationController?.popToRootViewController(animated: true)
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
extension CustomerListTableViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableview: UITableView) -> Int{
           return 1
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //fetchDataFromFirebase()
         let cell =
        tableView.dequeueReusableCell(withIdentifier: "customerCell")
        let customer = customerName[indexPath.row]
        
        cell?.textLabel?.text = customer.firstName
        cell?.detailTextLabel?.text = customer.customerId
        return cell!
    }
    
    override func viewWillAppear(_ animated: Bool) {
              iCustomerTable.reloadData()

          }
}
