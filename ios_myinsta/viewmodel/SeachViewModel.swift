//
//  SeachViewModel.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 21/5/22.
//

import Foundation

class SearchViewModel: ObservableObject{
    @Published var isLoading = false
    @Published var items: [User] = []
    
    func apiUserList(completion: @escaping () -> ()){
        isLoading = true
        items.removeAll()
        self.items.append(User(uid: "1", email: "abduqahhor2349@gmail.com", displayName: "abduqahhor2349"))
        self.items.append(User(uid: "1", email: "abduqahhor2349@gmail.com", displayName: "abduqahhor2349"))
        self.items.append(User(uid: "1", email: "abduqahhor2349@gmail.com", displayName: "abduqahhor2349"))
        self.items.append(User(uid: "1", email: "abduqahhor2349@gmail.com", displayName: "abduqahhor2349"))
        self.items.append(User(uid: "1", email: "abduqahhor2349@gmail.com", displayName: "abduqahhor2349"))
        self.items.append(User(uid: "1", email: "abduqahhor2349@gmail.com", displayName: "abduqahhor2349"))
        
        isLoading = false
        completion()
    }
}
