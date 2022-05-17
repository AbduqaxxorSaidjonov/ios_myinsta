//
//  HomeLikesScreen.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 15/5/22.
//

import SwiftUI

struct HomeLikesScreen: View {
    @ObservedObject var likesViewModel = LikesViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(likesViewModel.items, id: \.self){item in
                        PostCell(post: item).listRowInsets(EdgeInsets())
                    }
                }
                .listStyle(PlainListStyle())
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
