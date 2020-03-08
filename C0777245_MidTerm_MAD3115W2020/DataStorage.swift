//
//  DataStorage.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-08.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation
class DataStorage
{
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
        customerList.append(Customer.init(customerId: "gfh", firstName: "Me", lastName: "Me", emailId: "me@me", mobile: "8997"))
//        countryList.append(Country.init(name: "India", capital: "Afghanistan", flag: #imageLiteral(resourceName: "elephant.png")))
//        countryList.append(Country.init(name: "Canada", capital: "Afghanistan", flag: #imageLiteral(resourceName: "elephant.png")))
//        countryList.append(Country.init(name: "Afghanistan", capital: "Afghanistan", flag: #imageLiteral(resourceName: "elephant.png")))
//        countryList.append(Country.init(name: "Afghanistan", capital: "Afghanistan", flag: #imageLiteral(resourceName: "elephant.png")))
//        countryList.append(Country.init(name: "Afghanistan", capital: "Afghanistan", flag: #imageLiteral(resourceName: "elephant.png")))
//        countryList.append(Country.init(name: "Afghanistan", capital: "Afghanistan", flag: #imageLiteral(resourceName: "elephant.png")))
                                                  
    }
}
