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
    let billId: Int
    var billDate: Date
    //var billType: Enum.BillType
    var billAmount: Double = 0.0
   
    init(billId: Int, billDate: Date /* ,billType: Enum.BillType*/){  //constructor
         self.billId = billId //intializing variables necessary in class
         self.billDate = billDate
      //  self.billType = billType
     
       
     }

    func calculateBill() -> Double{
        return billAmount
    }

//    func display(){
//        print("\t\tBill Date : \(billDate.getFormattedDate())")
//         print("\t\tBill Type : \(billType)")
//        print("\t\tBill Amount : \(calculateBill().getFormattedAmount())")
//     }
    
}
