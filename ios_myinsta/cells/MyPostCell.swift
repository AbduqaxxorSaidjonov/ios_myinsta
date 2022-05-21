//
//  MyPostCell.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 22/5/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyPostCell: View {
    
    var post: Post
    var length: CGFloat
    
    var body: some View {
        VStack(spacing: 0){
            WebImage(url: URL(string: post.imgUrl!))
                .resizable()
                .frame(width: length, height: length)
                .scaledToFit()
            
            Text("Make a symbolic breakpoint at")
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
        MyPostCell(post: Post(title: "abduqahhor2349", content: "May 17,2022", imgUrl: Utils.image1), length: UIScreen.width)
    }
}
