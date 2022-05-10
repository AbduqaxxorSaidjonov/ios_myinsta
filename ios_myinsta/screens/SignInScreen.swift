//
//  SignInScreen.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 10/5/22.
//

import SwiftUI

struct SignInScreen: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Utils.color1,Utils.color2]), startPoint: .top, endPoint: .bottom)
                
                VStack(spacing: 10){
                    Spacer()
                    
                    Text("Instagram").foregroundColor(.white)
                        .font(.system(size: 35))
                    
                    ZStack(alignment: .leading){
                        if email.isEmpty{
                        Text("Email").foregroundColor(.white)
                        }
                        TextField("",text: $email)
                    }
                    .padding(.leading,10)
                    .frame(height: 50)
                    .background(.white.opacity(0.4))
                    .cornerRadius(8)
                    .padding(.top,20)
                    
                    ZStack(alignment: .leading){
                        if password.isEmpty{
                        Text("Password").foregroundColor(.white)
                        }
                        SecureField("",text: $password)
                    }
                    .padding(.leading,10)
                    .frame(height: 50)
                    .background(.white.opacity(0.4))
                    .cornerRadius(8)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,maxHeight: 50)
                            .background(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1.5).foregroundColor(.white.opacity(0.4)))
                    })
                    
                    Spacer()
                    
                    HStack{
                        Text("Don't have an account?").foregroundColor(.white)
                        NavigationLink(destination: SignUpScreen(), label: {
                            Text("Sign Up").foregroundColor(.white)
                                .fontWeight(.bold)
                        })
                    }
                    .frame(maxWidth: .infinity,maxHeight: 60)
                }
                .padding()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}