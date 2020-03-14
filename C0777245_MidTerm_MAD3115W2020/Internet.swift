//
//  Internet.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-11.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation


public class Internet: Bill
{
    var providerName: String
    var plannedGbUsed: String
    
    init(custId: String, billId: String, billDate: String, billType: String, billAmount: String, providerName: String, plannedGbUsed: String){
        self.providerName = providerName
        self.plannedGbUsed = plannedGbUsed
        super.init(custId: custId, billId: billId, billDate: billDate, billType: billType, billAmount: billAmount)
    }
 
}
