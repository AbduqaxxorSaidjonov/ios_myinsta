//
//  HomeLikesScreen.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 15/5/22.
//

import SwiftUI

struct HomeLikesScreen: View {
    @ObservedObject var likesViewModel = LikesViewModel()
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(likesViewModel.items, id: \.self){item in
                        if let uid = session.session?.uid!{
                            LikePostCell(uid: uid, viewModel: likesViewModel, post: item)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                }
                .listStyle(PlainListStyle())
                if likesViewModel.isLoading {
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
            .navigationBarTitle("likes",displayMode: .inline)
        }
        .onAppear{
            likesViewModel.apiPostList{
                print(likesViewModel.items.count)
            }
        }
       
    }
}

struct HomeLikesScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeLikesScreen()
    }
}
