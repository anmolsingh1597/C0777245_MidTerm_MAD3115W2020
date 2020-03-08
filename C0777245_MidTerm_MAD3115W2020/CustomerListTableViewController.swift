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
    var firstNameArray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchDataFromFirebase()
     //  printFirstNameArray()
    }
    static func getInstance() -> CustomerListTableViewController{
           return instance
       }
    
    func fetchDataFromFirebase() -> Array<String>{
        let refer = self.ref.child("Users") // this is refernce (it first check "Users" tree exist or not)
        refer.observeSingleEvent(of: .value, with: { (snapshot) in
        if let userDict = snapshot.value as? [String: [String: String]]{
            print("------------------------------------")
            //print(userDict)
            for value in userDict.values
            {
               // print(value["firstName"]!)
               // print(value["lastName"]!)
                    self.firstNameArray.append(value["firstName"]!)
            }
            dump(self.firstNameArray)
            //self.readData(users: userDict)
            //print(userDict.count)
            }})
        return self.firstNameArray
    }
    
    func printFirstNameArray(){
        print("Values")
        dump(firstNameArray)
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
        return firstNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //fetchDataFromFirebase()
         let cell =
               tableView.dequeueReusableCell(withIdentifier: "customerCell")
        // let customer = firstNameArray[indexPath.row]
        cell?.textLabel?.text = firstNameArray[0]
        //               cell?.detailTextLabel?.text = country.capital
//               cell?.imageView?.image = country.flag
       
               return cell!
    }
    
    override func viewWillAppear(_ animated: Bool) {
              iCustomerTable.reloadData()

          }
}
