//
//  HomeFeedScreen.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 15/5/22.
//

import SwiftUI

struct HomeFeedScreen: View {
    
    @Binding var tabSelection: Int
    var body: some View {
        NavigationView{
            ZStack{
                Text("Hello, Feed")
            }
            .navigationBarItems(trailing: Button(action: {
                self.tabSelection = 2
            }, label: {
                Image(systemName: "camera").foregroundColor(Utils.color2)
            })
                )
            .navigationBarTitle("app_name",displayMode: .inline)
        }
       
    }
}

struct HomeFeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedScreen(tabSelection: .constant(0))
    }
}
