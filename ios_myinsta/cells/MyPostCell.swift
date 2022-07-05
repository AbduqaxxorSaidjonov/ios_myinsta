//
//  MyPostCell.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 22/5/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyPostCell: View {
    
    var uid: String
    var viewModel: ProfileViewModel
    var post: Post
    var length: CGFloat
    
    var body: some View {
        VStack(spacing: 0){
            WebImage(url: URL(string: post.imgPost!))
                .resizable()
                .frame(width: length, height: length)
                .scaledToFit()
            
            Text(post.caption!)
                .foregroundColor(.black)
                .font(.system(size: 16))
                .padding(.top,10)
                .padding(.bottom,10)
                .frame(width: length)
        }
    }
}

struct MyPostCell_Previews: PreviewProvider {
    static var previews: some View {
        MyPostCell(uid: "uid", viewModel: ProfileViewModel(),post: Post(caption: "abduqahhor2349", imgPost: Utils.image2), length: UIScreen.width)
    }
}
