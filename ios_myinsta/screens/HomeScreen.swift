//
//  HomeScreen.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 15/5/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection){
            
            HomeFeedScreen(tabSelection: $tabSelection)
                .tabItem{
                    Image(systemName: "house")
                }
                .tag(0)
            HomeSearchScreen()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            HomeUploadScreen(tabSelection: $tabSelection)
                .tabItem{
                    Image(systemName: "plus.square")
                }
                .tag(2)
            HomeLikesScreen()
                .tabItem{
                    Image(systemName: "heart")
                }
                .tag(3)
            HomeProfileScreen()
                .tabItem{
                    Image(systemName: "person.circle")
                }
                .accentColor(Utils.color2)
            .tag(4)
        }
        .accentColor(Utils.color2)
        .onAppear{
            UITabBar.appearance().barTintColor = .white
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
