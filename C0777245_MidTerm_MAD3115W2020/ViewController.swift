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


}

