//
//  User.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 15/5/22.
//

import Foundation

struct User: Hashable{
    var uid: String?
    var email: String?
    var displayName: String?
    
    init(uid: String?, email: String?, displayName: String?){
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
