//
//  Hydro.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-11.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation


public class Hydro: Bill
{
    var agencyName: String
    var unitConsumed: String
    
    init(custId: String, billId: String, billDate: String, billType: String, billAmount: String, agencyName: String, unitConsumed: String){
        self.agencyName = agencyName
        self.unitConsumed = unitConsumed
        super.init(custId: custId, billId: billId, billDate: billDate, billType: billType, billAmount: billAmount)
    }
  
}
