//
//  ProfileScreen.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 25/8/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileScreen: View {
    
    @ObservedObject var profileViewModel = ProfileViewModel()
    var uid: String
    var user: User
    @State var level = 2
    @State var columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: UIScreen.width/2 - 15), spacing: 10), count: 2)
    
    func postSize() -> CGFloat{
        if level == 1{
            return UIScreen.width/CGFloat(level) - 20
        }
        return UIScreen.width/CGFloat(level) - 15
    }
    
    func postColumns(count: Int){
        level = count
        columns = Array(repeating: GridItem(.flexible(minimum: postSize()), spacing: 10), count: level)
    }
    
    
    var body: some View {
        NavigationView{
            ZStack{
            VStack(alignment: .center){
                HStack{
                    if !profileViewModel.imgUser.isEmpty{
                            WebImage(url: URL(string: profileViewModel.imgUser))
                            .resizable()
                                .clipShape(Circle())
                                .scaledToFill()
                                .frame(width: UIScreen.width/7, height: UIScreen.width/7)
                                .padding(.all,2)
                        .overlay(RoundedRectangle(cornerRadius: UIScreen.width/14).stroke(Utils.color2,lineWidth: 3))
                    }else {
                        Image("ic_person").resizable()
                            .clipShape(Circle())
                            .frame(width: UIScreen.width/7, height: UIScreen.width/7)
                            .padding(.all,2)
                        .overlay(RoundedRectangle(cornerRadius: UIScreen.width/14).stroke(Utils.color2,lineWidth: 3))
                    }
                    
                        VStack{
                            Text(String(profileViewModel.items.count))
                                .foregroundColor(.black)
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                            Text("Posts")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                        }
                        .frame(width: UIScreen.width/5, height: UIScreen.height/15)
                        
                        Divider().frame(maxHeight: UIScreen.height/25)
                        
                        VStack{
                            Text(String(profileViewModel.followers.count))
                                .foregroundColor(.black)
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                            Text("Followers")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                        }
                        .frame(width: UIScreen.width/5, height: UIScreen.height/15)
                        
                        Divider().frame(maxHeight: UIScreen.height/25)
                        
                        VStack{
                            Text(String(profileViewModel.following.count))
                                .foregroundColor(.black)
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                            Text("Following")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                        }
                        .frame(width: UIScreen.width/5, height: UIScreen.height/15)
                }
                HStack{
                VStack(alignment: .leading,spacing: 5){
                    Text(profileViewModel.displayName)
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                    Text(profileViewModel.email)
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .padding(.top,3)
                    Button{
                        
                    }label: {
                            Text("button_following")
                                .font(.system(size: 18))
                                .frame(height: 45)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.black.opacity(0.5))
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray,lineWidth: 1))
                                .padding(.top,15)
                    }
                    
                }
                .padding(.top, -15)
                .padding(30)
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button{
                        postColumns(count: 1)
                    }label: {
                       Image(systemName: "rectangle.grid.1x2")
                            .resizable()
                            .frame(width: 20, height: 25)
                            .foregroundColor(Utils.color2)
                    }
                    Spacer()
                    Button{
                        postColumns(count: 2)
                    }label: {
                        Image(systemName: "rectangle.grid.2x2")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Utils.color2)
                    }
                    Spacer()
                }
                .padding(.top,10)
                .padding(.bottom,10)
                .frame(maxWidth: .infinity)
                
                ScrollView{
                    LazyVGrid(columns: columns,spacing: 10){
                        ForEach(profileViewModel.items , id: \.self){item in
                            if let uid = uid{
                                MyPostCell(uid: uid, viewModel: profileViewModel, post: item, length: postSize())
                            }
                        }
                    }
                }
                .padding(.top,10)
                Spacer()
            }
                if profileViewModel.isLoading {
                    ZStack{
                        Color(.systemBackground)
                            .ignoresSafeArea()
                            .opacity(0.8)
                    ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Utils.color2))
                            .scaleEffect(2)
                    }
                }
            }
            .navigationBarTitle("\(profileViewModel.displayName)",displayMode: .inline)
        }
        .onAppear{
            profileViewModel.apiPostList(uid: uid)
            profileViewModel.apiLoadUser(uid: uid)
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen(uid: "uid",user: User(email: "abduqaxxor@gmail.com", displayName: "Abduqaxxor", imgUser: ""))
    }
}
