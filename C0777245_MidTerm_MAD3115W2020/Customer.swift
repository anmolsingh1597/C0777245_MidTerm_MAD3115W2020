//
//  Customer.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-08.
//  Copyright © 2020 Swift Project. All rights reserved.
//


import Foundation
public class Customer
{
    var customerId : String
    var firstName : String
    var lastName : String
    var emailId : String
    var mobile : String
    
    init(customerId: String, firstName: String, lastName: String, emailId : String, mobile: String)
    {
        self.customerId = customerId
        self.firstName = firstName
        self.lastName = lastName
        self.emailId = emailId
        self.mobile = mobile
    }
    
}
