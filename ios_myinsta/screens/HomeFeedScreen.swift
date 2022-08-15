//
//  HomeFeedScreen.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 15/5/22.
//

import SwiftUI

struct HomeFeedScreen: View {
    
    @Binding var tabSelection: Int
    @ObservedObject var viewModel = FeedViewModel()
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(viewModel.items, id: \.self){item in
                        if let uid = session.session?.uid!{
                            FeedPostCell(uid: uid, viewModel: viewModel, post: item)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                }
                .listStyle(PlainListStyle())
                
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
            .navigationBarItems(trailing: Button(action: {
                self.tabSelection = 2
            }, label: {
                Image(systemName: "camera").foregroundColor(Utils.color2)
            })
                )
            .navigationBarTitle("app_name",displayMode: .inline)
        }
        .onAppear{
            if let uid = session.session?.uid!{
                viewModel.apiFeedList(uid: uid)
            }
        }
       
    }
}

struct HomeFeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedScreen(tabSelection: .constant(0))
    }
}
