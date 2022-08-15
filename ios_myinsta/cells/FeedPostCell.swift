//
//  PostCell.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 17/5/22.
//

import SwiftUI
import SDWebImageSwiftUI


struct FeedPostCell: View {
    
    var uid: String
    var viewModel: FeedViewModel
    @State var post: Post
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0){
                VStack{
                    if !post.imgPost!.isEmpty{
                        WebImage(url: URL(string: post.imgUser!))
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 46, height: 46)
                            .padding(.all,2)
                    }else{
                    Image("ic_person").resizable().clipShape(Circle())
                        .frame(width: 46, height: 46)
                        .padding(.all,2)
                    }
                }
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Utils.color2,lineWidth: 2))
                VStack(alignment: .leading, spacing: 3){
                    Text(post.displayName!).fontWeight(.medium)
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                    
                    Text(post.time!).foregroundColor(.gray)
                        .font(.system(size: 15))
                }
                .padding(.leading,15)
               
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis").foregroundColor(.black)
                }
            }
            .padding(.leading,15)
            .padding(.trailing,15)
            .padding(.top,15)
            
            WebImage(url: URL(string: post.imgPost!))
                .resizable().scaledToFit()
                .padding(.top,10)
            
            HStack(spacing: 15){
                Button {
                    if post.isLiked!{
                        post.isLiked = false
                    }else{
                        post.isLiked = true
                    }
                    viewModel.apiLikePost(uid: uid, post: post)
                    
                } label: {
                    if post.isLiked!{
                    Image(systemName: "heart.fill").resizable()
                        .frame(width: 26, height: 26)
                        .foregroundColor(.red)
                    }
                    else{
                    Image(systemName: "heart").resizable()
                            .frame(width: 26, height: 26)
                    }
                    
                }
                .buttonStyle(PlainButtonStyle())
                Button{
                    
                } label: {
                    Image(systemName: "message").resizable()
                        .frame(width: 26, height: 26)
                }
                Button{
                    
                }label: {
                    Image(systemName: "paperplane").resizable()
                        .frame(width: 26, height: 26)
                }
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "bookmark").resizable()
                        .frame(width: 20, height: 26)
                }
            }
            .foregroundColor(.black)
            .padding(.leading,15)
            .padding(.trailing,15)
            .padding(.top,15)
            
            HStack(alignment: .top, spacing: 10){
                Text(post.displayName!).fontWeight(.bold) +
                Text(" \(post.caption!)")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                Spacer()
            }
            .padding(.all,15)
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedPostCell(uid: "uid", viewModel: FeedViewModel(), post: Post(caption: "symbolic", imgPost: Utils.image1))
    }
}
