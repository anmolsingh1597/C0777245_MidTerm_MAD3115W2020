//
//  DataStorage.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-08.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation
import Firebase

class DataStorage
{
    var ref = Database.database().reference()
    private static let instance = DataStorage()
    private lazy var customerList: [Customer] = []
    private init (){}
    
    static func getInstance() -> DataStorage{
        return instance
    }
    
    func addCustomer(customer: Customer){
        self.customerList.append(customer)
    }
    
    func getAllCustomers() -> [Customer]{
        return self.customerList
    }
    func loadData(){
        let refer = self.ref.child("Users")
        refer.observeSingleEvent(of: .value, with: {(snapshot)
            in
            if let userDict = snapshot.value as? [String: [String: String]]{
                for value in userDict.values{
                    self.customerList.append((Customer.init(customerId: value["id"]!, firstName: value["firstName"]!, lastName: value["lastName"]!, emailId: value["email"]!, mobile: value["mobile"]!)))
                }
            }
        })
    }
    
}
