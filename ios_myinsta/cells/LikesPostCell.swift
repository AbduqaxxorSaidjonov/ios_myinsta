//
//  LikesPostCell.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 5/7/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct LikePostCell: View {
    
    var uid: String
    var viewModel: LikesViewModel
    @State var post: Post
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0){

                VStack{
                    if !post.imgUser!.isEmpty{
                        WebImage(url: URL(string: post.imgUser!))
                            .resizable().clipShape(Circle())
                            .frame(width: 46, height: 46)
                            .padding(.all,2)
                    }else{
                        Image("ic_person").resizable().clipShape(Circle())
                        .frame(width: 46, height: 46)
                        .padding(.all,2)
                    }
                }
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Utils.color2, lineWidth: 2))
                
                VStack(alignment: .leading,spacing: 3){
                    Text(post.displayName!)
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                    Text(post.time!)
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                }.padding(.leading,15)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "ellipsis")
                })
                .foregroundColor(.black)
            }
            .padding(.leading,15)
            .padding(.trailing,15)
            .padding(.top,15)
            
            WebImage(url: URL(string: post.imgPost!))
                .resizable()
                .scaledToFit()
                .padding(.top,10)
            
            HStack(spacing: 0){
                Button(action: {
                    
                }, label: {
                    Image(systemName: "heart").resizable()
                        .frame(width: 26, height: 26)
                })
                Button(action: {
                    
                }, label: {
                    Image(systemName: "message").resizable()
                        .frame(width: 26, height: 26)
                })
                .padding(.leading,15)
                Button(action: {
                    
                }, label: {
                    Image(systemName: "paperplane").resizable()
                        .frame(width: 26, height: 26)
                })
                .padding(.leading,15)
                
                Spacer()
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

struct LikePostCell_Previews: PreviewProvider {
    static var previews: some View {
        LikePostCell(uid: "uid", viewModel: LikesViewModel(), post: Post(caption: "symbolic", imgPost: Utils.image1))
    }
}

