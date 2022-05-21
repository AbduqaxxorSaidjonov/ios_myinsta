//
//  HomeSearchScreen.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 15/5/22.
//

import SwiftUI

struct HomeSearchScreen: View {
    
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
                            UserCell(user: item)
                                .listRowInsets(EdgeInsets())
                                .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .listStyle(PlainListStyle())
                    Spacer()
                }
            }
            .navigationBarTitle("search_title",displayMode: .inline)
        }
        .onAppear{
            viewModel.apiUserList {
                print(viewModel.items.count)
            }
        }
    }
}

struct HomeSearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchScreen()
    }
}
