//
//  HomeSearchScreen.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 15/5/22.
//

import SwiftUI

struct HomeSearchScreen: View {
    
    @EnvironmentObject var session: SessionStore
    @State var keyword = ""
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    TextField("search_user",text: $keyword)
                        .padding(.leading,15)
                        .padding(.trailing,15)
                        .frame(height: 45)
                        .font(.system(size: 16))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.5),lineWidth: 0.5))
                        .padding(.leading,10).padding(.trailing,10).padding(.top,10)
                    List{
                        ForEach(viewModel.items , id: \.self){item in
                            let uid = (session.session?.uid)!
                            UserCell(uid: uid, user: item, viewModel: viewModel).listRowInsets(EdgeInsets())
                                .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .listStyle(PlainListStyle())
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
            .navigationBarTitle("search_title",displayMode: .inline)
        }
        .onAppear{
            let uid = (session.session?.uid)!
            viewModel.apiUserList(uid: uid, keyword: keyword)
        }
    }
}

struct HomeSearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchScreen()
    }
}
