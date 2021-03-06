//
//  HomeUploadScreen.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 15/5/22.
//

import SwiftUI

struct HomeUploadScreen: View {
    
    @EnvironmentObject var session: SessionStore
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @State private var isSheet = false
    @Binding var tabSelection: Int
    @State var caption = ""
    @ObservedObject var viewModel = UploadViewModel()
    
    func uploadPost(){
        if caption.isEmpty || selectedImage == nil{
            return
        }
        let uid = (session.session?.uid)!
        viewModel.apiUploadPost(uid: uid,caption: caption,image: selectedImage!){result in
            if result{
                self.selectedImage = nil
                self.caption = ""
                self.tabSelection = 0
            }
        }
    }
    
    
    var actionSheet: ActionSheet{
        
        return ActionSheet(title: Text("action"), buttons: [
            .default(Text("pick_photo"), action: {
                self.sourceType = .photoLibrary
                self.isImagePickerDisplay.toggle()
            }),
            .default(Text("take_photo"), action: {
                self.sourceType = .camera
                self.isImagePickerDisplay.toggle()
            }),
            .cancel(Text("cancel"))
        ])
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    ZStack{
                        if selectedImage != nil{
                            Image(uiImage: self.selectedImage!)
                                .resizable()
                                .frame(maxWidth: UIScreen.width,maxHeight: UIScreen.width)
                                .scaledToFill()
                            
                            VStack{
                                HStack{
                                    Spacer()
                                Button(action: {
                                    self.selectedImage = nil
                                    self.caption = ""
                                }, label: {
                                    Image(systemName: "xmark.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30,height: 30)
                                })
                                .frame(width: 32, height: 32)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.white))
                                .padding()
                                }
                                Spacer()
                            }
                            
                        }
                        else{
                            Button(action: {
                            self.isSheet = true
                            },label: {
                                Image(systemName: "camera")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                            }
                        )
                            .actionSheet(isPresented: $isSheet,content: {
                                self.actionSheet
                            })
                            .sheet(isPresented: $isImagePickerDisplay, content: {
                                ImagePickerView(selectedImage: $selectedImage, sourceType: self.sourceType)
                            })
                            
                    }
                    }
                    .frame(maxWidth: UIScreen.width, maxHeight: UIScreen.width)
                    .background(Color.gray.opacity(0.2))
                    VStack{
                        TextField("caption",text: $caption)
                            .font(.system(size: 17,design: .default))
                            .frame(height: 45)
                            .padding(.leading , 20)
                            .padding(.trailing, 20)
                            
                        Divider()
                    }
                    .padding(.top,10)
                    Spacer()
                }
                if viewModel.isLoading {
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
            .navigationBarTitle("upload",displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
               uploadPost()
            }, label: {
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(Utils.color2)
            }))
        }
        
    }
}

struct HomeUploadScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeUploadScreen(tabSelection: .constant(0))
    }
}
