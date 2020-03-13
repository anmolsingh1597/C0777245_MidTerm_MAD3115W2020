//
//  Bill.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-11.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation

public class Bill
{
    var custId: String
    var billId: String
    var billDate: String
    var billType: String
    var billAmount: String
   
    init(custId: String, billId: String, billDate: String, billType: String, billAmount: String){
        self.custId = custId
        self.billId = billId
        self.billDate = billDate
        self.billType = billType
        self.billAmount = billAmount
    }

    
}
