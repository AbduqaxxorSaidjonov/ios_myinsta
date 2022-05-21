
import Foundation

class ProfileViewModel: ObservableObject{
    
    @Published var isLoading = false
    @Published var items: [Post] = []
    
    func apiPostList(completion: @escaping () -> ()){
        isLoading = true
        items.removeAll()
        
        self.items.append(Post(title: "abduqahhor2349", content: "May 17,2022", imgUrl: Utils.image1))
        self.items.append(Post(title: "abduqahhor2349", content: "May 17,2022", imgUrl: Utils.image2))
        self.items.append(Post(title: "abduqahhor2349", content: "May 17,2022", imgUrl: Utils.image3))
        self.items.append(Post(title: "abduqahhor2349", content: "May 17,2022", imgUrl: Utils.image1))
        self.items.append(Post(title: "abduqahhor2349", content: "May 17,2022", imgUrl: Utils.image2))
        self.items.append(Post(title: "abduqahhor2349", content: "May 17,2022", imgUrl: Utils.image3))
        
        isLoading = false
        completion()
    }
}
