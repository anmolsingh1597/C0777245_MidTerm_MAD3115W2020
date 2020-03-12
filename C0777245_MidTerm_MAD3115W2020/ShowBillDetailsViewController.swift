//
//  ShowBillDetailsViewController.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-10.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class ShowBillDetailsViewController: UIViewController {
    static var customerId: String?
    static var firstName: String?
    static var lastName: String?
    @IBOutlet weak var iCustomerId: UILabel!
    @IBOutlet weak var iFirstName: UILabel!
    @IBOutlet weak var iLastName: UILabel!
    var billList: [Bill] = []
    var billArray: [Bill] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cellValue()
        billList = DataStorage.getInstance().getAllBills()

        billArray = billList.filter{$0.custId == ShowBillDetailsViewController.customerId}

        print("---------------------------------")
        for value in billList{
            print(value.custId)}
        print("---------------------------------")
        for value in billArray{
            print(value.custId)
            print(value.billId)
        }
     
        
    }
    
    @IBAction func iCustomers(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let customerVC = sb.instantiateViewController(identifier: "customerTableListVC") as! CustomerListTableViewController
//        self.navigationController?.popViewController(animated: true)
        self.navigationController?.pushViewController(customerVC, animated: true)
    }
    
    func cellValue(){
              iCustomerId.text = ShowBillDetailsViewController.self.customerId
              iFirstName.text = ShowBillDetailsViewController.self.firstName
              iLastName.text = ShowBillDetailsViewController.self.lastName
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

extension ShowBillDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return billArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BillTableViewCell", for: indexPath) as! BillTableViewCell
        
//        let bill = billList[indexPath.row]

        if billArray.isEmpty == true{
            cell.textLabel?.text = "No bill assign to this Customer"
        
        }else{
        let bill = billArray[indexPath.row]
        
        cell.iCustomerID.text =  "Customer Id: " + bill.custId
        cell.iBillId.text = "Bill Id: " + bill.billId
        cell.iDate.text = "Date: " + bill.billDate
        cell.iBillType.text = "Bill Type: " + bill.billType
        cell.iBillAmount.text = "Bill Amount: " + bill.billAmount
        
    }
//        }else{
//        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
     
    func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }
    
}
