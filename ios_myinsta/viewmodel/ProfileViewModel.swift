
import Foundation
import UIKit

class ProfileViewModel: ObservableObject{
    
    @Published var isLoading = false
    @Published var items: [Post] = []
    @Published var email = ""
    @Published var displayName = ""
    @Published var imgUser = ""
    
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
    
    func apiSignOut(){
        SessionStore().signOut()
    }
    
    func apiLoadUser(uid: String){
        DatabaseStore().loadUser(uid: uid, completion: { user in
            self.email = (user?.email)!
            self.displayName = (user?.displayName)!
            self.imgUser = (user?.imgUser)!
            print(self.imgUser)
            self.isLoading = false
        })
    }
    
    func apiUploadMyImage(uid: String,image: UIImage){
        self.isLoading = true
        StorageStore().uploadUserImage(uid: uid, image, completion: {downloadUrl in
            self.apiUpdateMyImage(uid: uid,imgUser: downloadUrl)
            self.apiLoadUser(uid: uid)
        })
    }
    
    func apiUpdateMyImage(uid: String, imgUser: String?){
        DatabaseStore().updateMyImage(uid: uid, imgUser: imgUser)
    }
}
