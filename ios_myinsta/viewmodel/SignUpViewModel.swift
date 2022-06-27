//
//  SignUpViewModel.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 27/6/22.
//

import Foundation

class SignUpViewModel: ObservableObject{
    @Published var isLoading = false
    
    func apiSignUp(email: String,password: String,completion: @escaping (Bool) -> ()){
        isLoading = true
        
        SessionStore().signUp(email: email, password: password, handler: {(res,err) in
            self.isLoading = false
            if err != nil {
                completion(false)
            }else{
                completion(true)
            }
            
        })
    }
}
