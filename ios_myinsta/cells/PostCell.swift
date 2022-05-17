//
//  PostCell.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 17/5/22.
//

import SwiftUI
import SDWebImageSwiftUI


struct PostCell: View {
    
    var post: Post
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0){
                VStack{
                    Image("ic_person").resizable().clipShape(Circle())
                        .frame(width: 46, height: 46)
                        .padding(.all,2)
                }
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Utils.color2,lineWidth: 2))
                VStack(alignment: .leading, spacing: 3){
                    Text(post.title!).fontWeight(.medium)
                        .font(.system(size: 17))
                        .foregroundColor(.black)
                    
                    Text(post.content!).foregroundColor(.gray)
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
            
            WebImage(url: URL(string: post.imgUrl!))
                .resizable().scaledToFit()
                .padding(.top,10)
            
            HStack(spacing: 15){
                Button {
                    
                } label: {
                    Image(systemName: "heart").resizable()
                        .frame(width: 26, height: 26)
                }
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
                Text(post.title!).fontWeight(.bold) +
                Text(" Make asymbolic breakpoint at UIView, category on UIView listed in")
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
        PostCell(post: Post(title: "abduqahhor2349", content: "May 17,2022", imgUrl: Utils.image1))
    }
}
