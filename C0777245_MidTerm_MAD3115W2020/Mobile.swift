//
//  Mobile.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-11.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation

public class Mobile: Bill
{
    var mobileManufacturerName: String
    var planName: String
    var mobileNumber: String
    var internetGbUsed: String
    var minuteUsed: String
    
    init(custId: String, billId: String, billDate: String, billType: String, billAmount: String, mobileManufacturerName: String, planName: String, mobileNumber: String, internetGbUsed: String, minuteUsed: String){
        
        self.mobileManufacturerName = mobileManufacturerName
        self.planName = planName
        self.mobileNumber = mobileNumber
        self.internetGbUsed = internetGbUsed
        self.minuteUsed = minuteUsed
        super.init(custId: custId, billId: billId, billDate: billDate, billType: billType, billAmount: billAmount)
    }
}
