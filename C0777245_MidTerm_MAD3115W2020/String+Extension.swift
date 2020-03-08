//
//  String+Extension.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-08.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation
extension String{

    func emailValidation() -> String {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        if emailPredicate.evaluate(with: self) == true{
            return self
        }
        return "Invalid Email"
    }
    
    func mobileNumberValidation() -> String {
        let phonePattern = "^\\d{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phonePattern)
        let result =  phoneTest.evaluate(with: self)
        if result == true{
            return self
        }
        
        return "Invalid Mobile Number"
    }

}
