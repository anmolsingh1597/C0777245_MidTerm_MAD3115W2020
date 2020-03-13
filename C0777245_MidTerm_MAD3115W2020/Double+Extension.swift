//
//  Double+Extension.swift
//  C0777245_MidTerm_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-13.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation

extension Double{
     func getFormattedAmount() -> String
  {
         return String(format: "$%0.2f", Double(self))
  }
}
