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
    private lazy var billList: [Bill] = []
    private init (){}
    
    static func getInstance() -> DataStorage{
        return instance
    }
    
    func addCustomer(customer: Customer){
        self.customerList.append(customer)
    }
    
    func addBill(bill: Bill){
        self.billList.append(bill)
    }
    
    func getAllBills() -> [Bill]{
        return self.billList
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
        let billRefer = self.ref.child("Bills")
        billRefer.observeSingleEvent(of: .value, with: {(snapshot)
            in
            if let billDict = snapshot.value as? [String: [String: String]]{
                for value in billDict.values{
                    if value["billType"] == "Mobile"{
                        self.billList.append((Mobile(custId: value["custId"] ?? "", billId: value["id"] ?? "", billDate: value["date"] ?? "", billType: value["billType"] ?? "", billAmount: value["billAmount"] ?? "", mobileManufacturerName: value["mobileManufacturer"] ?? "", planName: value["planName"] ?? "", mobileNumber: value["mobileNumber"] ?? "", internetGbUsed: value["internetGb"] ?? "", minuteUsed: value["minutes"] ?? "")))
                    }else if value["billType"] == "Internet"{
                        self.billList.append((Internet(custId: value["custId"] ?? "", billId: value["id"] ?? "", billDate: value["date"] ?? "", billType: value["billType"] ?? "", billAmount: value["billAmount"] ?? "", providerName: value["providerName"] ?? "", plannedGbUsed: value["internetGb"] ?? "")))
                    }else if value["billType"] == "Hydro" {
                        self.billList.append((Hydro(custId: value["custId"] ?? "", billId: value["id"] ?? "", billDate: value["date"] ?? "", billType: value["billType"] ?? "", billAmount: value["billAmount"] ?? "", agencyName: value["agencyName"] ?? "", unitConsumed: value["unitsConsumed"] ?? "")))
                    }
                    else {
                        
                    }
                }
            }
        })
    }
    
}
