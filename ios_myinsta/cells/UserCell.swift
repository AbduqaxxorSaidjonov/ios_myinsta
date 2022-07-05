//
//  UserCell.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 21/5/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserCell: View {
    
    var uid: String
    var user: User
    var viewModel: SearchViewModel
    
    var body: some View {
        HStack{
        VStack{
            if !user.imgUser!.isEmpty{
                WebImage(url: URL(string: user.imgUser!))
                    .resizable().clipShape(Circle())
                        .frame(width: 46, height: 46)
                        .padding(.all,2)
            }
            else{
            Image("ic_person").resizable().clipShape(Circle())
                .frame(width: 46, height: 46)
                .padding(.all,2)
            }
        }
        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Utils.color2,lineWidth: 2))
            
            VStack(alignment: .leading,spacing: 3){
                Text(user.displayName!).fontWeight(.medium)
                    .foregroundColor(.black)
                    .font(.system(size: 17))
                Text(user.email!)
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
            }.padding(.leading,10)
            
            Spacer()
            
            Button{
                if user.isFollowed{
                    viewModel.apiUnFollowUser(uid: uid, to: user)
                }else{
                    viewModel.apiFollowUser(uid: uid, to: user)
                }
            }label: {
                if user.isFollowed{
                    Text("button_following")
                        .font(.system(size: 15))
                        .frame(width: UIScreen.width/4, height: 30)
                        .foregroundColor(.black.opacity(0.5))
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray,lineWidth: 1))
                }else{
                    Text("button_follow")
                        .font(.system(size: 15))
                        .frame(width: UIScreen.width/4, height: 30)
                        .foregroundColor(.black.opacity(0.5))
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray,lineWidth: 1))
                }
               
            }
            
        }.padding(.all,20)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(uid: "uid",user: User(uid: "1", email: "abduqahhor2349@gmail.com", displayName: "abduqahhor2349"), viewModel: SearchViewModel())
    }
}
