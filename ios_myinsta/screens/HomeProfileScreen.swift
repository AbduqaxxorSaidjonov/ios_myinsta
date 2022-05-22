//
//  HomeProfileScreen.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 15/5/22.
//

import SwiftUI

struct HomeProfileScreen: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    @State var level = 2
    @State var columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: UIScreen.width/2 - 15), spacing: 10), count: 2)
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var isImagePickerDisplay = false
    @State private var selectedImage: UIImage?
    @State private var isSheet = false
    
    var actionSheet: ActionSheet{
        return ActionSheet(title: Text("action"), buttons: [
            .default(Text("pick_photo"),action: {
                self.sourceType = .photoLibrary
                self.isImagePickerDisplay.toggle()
            }),.default(Text("take_photo"),action: {
                self.sourceType = .camera
                self.isImagePickerDisplay.toggle()
            }),
            .cancel(Text("cancel"))])
    }
    
    init() {
        columns = Array(repeating: GridItem(.flexible(minimum: postSize()), spacing: 10), count: level)
    }
    
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
                VStack{
                    HStack(spacing: 0){
                        if self.selectedImage != nil {
                            VStack{
                            Image(uiImage: self.selectedImage!)
                                .resizable()
                                    .clipShape(Circle())
                                    .scaledToFill()
                                    .frame(width: UIScreen.width/5, height: UIScreen.width/5)
                                    .padding(.all,2)
                            }
                            .overlay(RoundedRectangle(cornerRadius: UIScreen.width/10).stroke(Utils.color2,lineWidth: 3))
                        }
                        else{
                        VStack{
                        Image("ic_person").resizable()
                            .clipShape(Circle())
                            .frame(width: UIScreen.width/5, height: UIScreen.width/5)
                            .padding(.all,2)
                        }
                        .overlay(RoundedRectangle(cornerRadius: UIScreen.width/10).stroke(Utils.color2,lineWidth: 3))
                    }
                        Button{
                            self.isSheet = true
                        }label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable().frame(width: 20, height: 20)
                        }
                        .actionSheet(isPresented: $isSheet, content: {
                            self.actionSheet
                        })
                        .sheet(isPresented: $isImagePickerDisplay, content: {
                            ImagePickerView(selectedImage: $selectedImage, sourceType: self.sourceType)
                        })
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
                        .offset(x: -UIScreen.width/17, y: UIScreen.width/13)
                        
                        HStack{
                            VStack{
                                Text("12")
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
                                Text("647")
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
                                Text("279")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17))
                                    .fontWeight(.medium)
                                Text("Following")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15))
                            }
                            .frame(width: UIScreen.width/5, height: UIScreen.height/15)
                        }
                        
                    }
                    VStack(alignment: .leading, spacing: 5){
                        Text("Abduqahhor Saidjonov")
                            .foregroundColor(.black)
                            .font(.system(size: 17))
                            .fontWeight(.medium)
                            .padding(.top,15)
                        Text("abduqahhor2349@gmail.com")
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                            .padding(.top,3)
                        Button{
                            
                        }label: {
                            Text("edit_profile")
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                        }
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.8)))
                        .padding(.top,15)
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
                                ForEach(viewModel.items , id: \.self){item in
                                    MyPostCell(post: item, length: postSize())
                                }
                            }
                        }
                        .padding(.top,10)
                    }
                    
                    Spacer()
                }.padding(.all,20)
            }
            .navigationBarTitle("profile_page",displayMode: .inline)
            .navigationBarItems(trailing: Button{
            }label: {
            Image(systemName: "pip.exit")
                    .foregroundColor(.black)
            })
        }
        .onAppear{
            viewModel.apiPostList {
                print(viewModel.items.count)
            }
        }
    }
}

struct HomeProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeProfileScreen()
    }
}
