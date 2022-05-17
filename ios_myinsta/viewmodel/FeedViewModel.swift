//
//  FeedViewModel.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 17/5/22.
//

import Foundation

class FeedViewModel: ObservableObject{
    @Published var isLoading = false
    @Published var items: [Post] = []
    
    func apiPostList(completion: @escaping () -> ()){
        isLoading = true
        items.removeAll()
        
        self.items.append(Post(title: "abduqahhor2349", content: "May 17,2022", imgUrl: Utils.image1))
        self.items.append(Post(title: "abduqahhor2349", content: "May 25,2022", imgUrl: Utils.image2))
        self.items.append(Post(title: "abduqahhor2349", content: "November 8,2020", imgUrl: Utils.image3))
        self.items.append(Post(title: "abduqahhor2349", content: "May 17,2022", imgUrl: Utils.image1))
        self.items.append(Post(title: "abduqahhor2349", content: "November 8,2020", imgUrl: Utils.image3))
        
        completion()
    }
}
