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
    var internetGbUsed: Double
    var minuteUsed: Double
    
    init(billId: Int, billDate: Date, mobileManufacturerName: String, planName: String, mobileNumber: String, internetGbUsed: Double, minuteUsed: Double){
        
        self.mobileManufacturerName = mobileManufacturerName
        self.planName = planName
        self.mobileNumber = mobileNumber
        self.internetGbUsed = internetGbUsed
        self.minuteUsed = minuteUsed
        super.init(billId: billId, billDate: billDate /*, billType: Enum.BillType.Mobile*/)
    }
    
//    func isValidMobileNumber(value: String) -> Bool {
//          let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
//          let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
//        let result =  phoneTest.evaluate(with: value)
//          return result
//      }
    
   override func calculateBill() -> Double{
        
    super.billAmount =  3.43 * self.internetGbUsed + 0.73*self.minuteUsed
        return super.billAmount
    }
    
//    override func display() {
//        print("\t\tBill ID : \(billId.concatMobilePrefix())")
//        super.display()
//        print("\t\tManufactuer Name : \(mobileManufacturerName)")
//        print("\t\tPlan Name : \(planName)")
//           if self.isValidMobileNumber(value: mobileNumber){
//                 print("\t\tMobile Number : \(self.mobileNumber)")
//            }
//            else{
//                print("\t\tMobile Number : invalid mobile number")
//            }
//        print("\t\tInternet Used : \(internetGbUsed.concatGb())")
//        print("\t\tMinutes Used : \(minuteUsed.concatMinutes())")
//
//    }
//
}
