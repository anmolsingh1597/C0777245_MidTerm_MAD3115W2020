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
    var ref = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchDataFromFirebase()
    }
    
    func fetchDataFromFirebase(){
        let refer = self.ref.child("Users") // this is refernce (it first check "Users" tree exist or not)
        refer.observeSingleEvent(of: .value, with: { (snapshot) in
        if let userDict = snapshot.value as? [String: [String: String]]{
            print("------------------------------------")
            //print(userDict)
            for v in userDict.values
            {
                print(v["firstName"])
            }
            //self.readData(users: userDict)
            //print(userDict.count)
            }})
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
