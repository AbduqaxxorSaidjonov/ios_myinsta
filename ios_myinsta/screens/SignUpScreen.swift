//
//  SignUpScreen.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 10/5/22.
//

import SwiftUI

struct SignUpScreen: View {
    
    @State var email = ""
    @State var fullname = ""
    @State var password = ""
    @State var cnpassword = ""
    @Environment(\.presentationMode) var presentation
    
  
    var body: some View {
        NavigationView{
            
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Utils.color1, Utils.color2]), startPoint: .top, endPoint: .bottom)
                
                VStack(spacing: 10){
                    Spacer()
                    Text("app_name").foregroundColor(.white)
                        .font(Font.custom("Billabong",size: 45))
                    ZStack(alignment: .leading){
                        if fullname.isEmpty{
                            Text("fullname").foregroundColor(.white.opacity(0.6))
                        }
                        TextField("",text: $fullname)
                    }
                    .padding(.leading,10)
                    .frame(height: 50)
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(8)
                    .padding(.top,20)
                    
                    ZStack(alignment: .leading){
                        if email.isEmpty{
                            Text("email")
                                .foregroundColor(.white.opacity(0.6))
                        }
                        TextField("",text: $email)
                    }
                    .padding(.leading,10)
                        .frame(height: 50)
                        .background(.white.opacity(0.4))
                        .cornerRadius(8)
                    
                    ZStack(alignment: .leading){
                        if password.isEmpty{
                            Text("password").foregroundColor(.white.opacity(0.6))
                        }
                        SecureField("",text: $password)
                    }
                    .padding(.leading,10)
                    .frame(height: 50)
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(8)
                    
                    ZStack(alignment: .leading){
                        if cnpassword.isEmpty{
                            Text("cpassword")
                                .foregroundColor(.white.opacity(0.6))
                        }
                        SecureField("",text: $cnpassword)
                    }
                    .padding(.leading,10)
                    .frame(height: 50)
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(8)
                    
                    Button(action: {
                        
                    },
                           label: {
                        Text("sign_up")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1.5).foregroundColor(.white.opacity(0.4)))
                    })
                    Spacer()
                    HStack{
                        Text("already_have_account")
                            .foregroundColor(.white)
                        Button(action: {
                            self.presentation.wrappedValue.dismiss()
                        }
                        , label: {
                            Text("sign_in")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        })
                    }
                    .frame(maxWidth: .infinity,maxHeight: 70)
                }
                .padding(10)
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarItems(leading: Button(action: {
                self.presentation.wrappedValue.dismiss()
            }, label: {
                HStack{
                    Image(systemName: "chevron.backward")
                    Text("Back")
                }
                .foregroundColor(.white)
            }))
        }
        .navigationBarHidden(true)
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
