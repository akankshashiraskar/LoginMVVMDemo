//
//  VallidationExtension.swift
//  LoginMVVMDemo
//
//  Created by `baps on 02/07/21.
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
   // return emailTest.evaluate(with: strEmail)
    }
    public var length: Int {
        return self.count
    }
    
}
