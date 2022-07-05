//
//  LikesViewModel.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 17/5/22.
//



import Foundation

class LikesViewModel: ObservableObject{
    @Published var isLoading = false
    @Published var items: [Post] = []
    
    func apiPostList(completion: @escaping () -> ()){
        isLoading = true
        items.removeAll()
        
       
        completion()
    }
}
