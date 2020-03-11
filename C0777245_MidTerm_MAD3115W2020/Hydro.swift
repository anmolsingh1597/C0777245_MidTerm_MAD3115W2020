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
    var unitConsumed: Double
    
    init(billId: Int, billDate: Date, agencyName: String, unitConsumed: Double){
        self.agencyName = agencyName
        self.unitConsumed = unitConsumed
        super.init(billId: billId, billDate: billDate/*, billType: Enum.BillType.Hydro*/)
    }
    
   override func calculateBill() -> Double{
        
    super.billAmount = 1.73 * self.unitConsumed
        return super.billAmount
    }
    
//    override func display() {
//        print("\t\tBill ID : \(self.billId.concatHydroPrefix())")
//        super.display()
//        print("\t\tAgency Name : \(self.agencyName)")
//        print("\t\tUnits Consumed : \(self.unitConsumed.concatUnits())")
//    }
//    
}
