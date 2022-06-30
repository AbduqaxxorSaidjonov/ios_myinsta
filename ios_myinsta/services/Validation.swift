//
//  Validation.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 29/6/22.
//

import Foundation

class EmailValidationObj: ObservableObject{
    @Published var email = ""{
        didSet{
            if self.email.isEmpty {
                self.error = "Required!"
            }else if !self.email.isValidEmail() {
                self.error = "Invalid email!"
            }else {
                self.error = ""
            }
            
        }
    }
    
    @Published var error = ""
}

class PasswordValidationObj: ObservableObject{
    @Published var pass = ""{
        didSet{
            self.isValidPassword()
        }
    }
    
    @Published var error = ""
    
    private func isValidPassword(){
        guard !self.pass.isEmpty else{
            self.error = "Required!"
            return
        }
        
        let setPassError = self.pass.isPassword() == false
        
        if setPassError{
            if self.pass.count < 6{
                self.error = "Must be at least 6 characters!"
                return
            }
            
            if !self.pass.isUpperCase(){
                self.error = "Must contain at least one uppercase!"
                return
            }
            
            if !self.pass.isLowerCase(){
                self.error = "Must contain at least one lowercase!"
                return
            }
            
            if !self.pass.containsCharacter(){
                self.error = "Must contain at least one special character!"
                return
            }
            
            if !self.pass.containsDigit(){
                self.error = "Must contain at least one digit!"
                return
            }
        }else{
            self.error = ""
        }
    }
}

extension String {
    func isValidEmail() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@",emailRegEx)
        let result = emailTest.evaluate(with: self)
        return result
    }
    
    func isPassword() -> Bool{
        let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,16}"
        let passwordTest = NSPredicate(format: " SELF MATCHES %@",passwordRegEx)
        let result = passwordTest.evaluate(with: self)
        return result
    }
    
    func isUpperCase() -> Bool{
        let uppercaseReqRegEx = ".*[A-Z]+.*"
        return NSPredicate(format: " SELF MATCHES %@",uppercaseReqRegEx).evaluate(with: self)
    }
    
    func isLowerCase() -> Bool{
        let lowercaseReqRegEx = ".*[a-z]+.*"
        return NSPredicate(format: " SELF MATCHES %@",lowercaseReqRegEx).evaluate(with: self)
    }
    
    func containsCharacter() -> Bool{
        let characterReqRegEx = ".*[!@#$%^&*()\\-_=+{}|?>.<]+.*"
        return NSPredicate(format: " SELF MATCHES %@",characterReqRegEx).evaluate(with: self)
    }
    
    func containsDigit() -> Bool{
        let digitReqRegEx = ".*[0-9]+.*"
        return NSPredicate(format: " SELF MATCHES %@",digitReqRegEx).evaluate(with: self)
    }
}
