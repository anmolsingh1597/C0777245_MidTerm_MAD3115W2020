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
    var plannedGbUsed: Double
    
    init(billId: Int, billDate: Date, providerName: String, plannedGbUsed: Double){
        self.providerName = providerName
        self.plannedGbUsed = plannedGbUsed
        super.init(billId: billId, billDate: billDate/*, billType: Enum.BillType.Internet*/)
    }
    
   override func calculateBill() -> Double{
        
    super.billAmount = 7.16 * self.plannedGbUsed
        return super.billAmount
    }
//    
//    override func display() {
//        print("\t\tBill ID : \(self.billId.concatInternetPrefix())")
//        super.display()
//        print("\t\tProvider Name : \(self.providerName)")
//        print("\t\tInternet GB Used : \(self.plannedGbUsed.concatGb())")
//    }
//    
}
