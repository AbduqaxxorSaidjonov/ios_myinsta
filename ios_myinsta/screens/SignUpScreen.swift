//
//  SignUpScreen.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 10/5/22.
//

import SwiftUI

struct SignUpScreen: View {
    
    @ObservedObject var emailObj = EmailValidationObj()
    @ObservedObject var passwordObj = PasswordValidationObj()
    @ObservedObject var viewModel = SignUpViewModel()
    @EnvironmentObject var session: SessionStore
    @State var email = ""
    @State var password = ""
    @State var fullname = ""
    @State var cnpassword = ""
    @Environment(\.presentationMode) var presentation
    
    func doSignUp(){
        email = emailObj.email
        password = emailObj.email
        viewModel.apiSignUp(email: email, password: password, completion: {
            result in
            if !result {
                
            }else{
                var user = User(email: email, displayName: fullname, password: password, imgUser: "")
                user.uid = session.session?.uid
                presentation.wrappedValue.dismiss()
            }
        })
    }
  
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
                    VStack(alignment: .leading,spacing: 4){
                    ZStack(alignment: .leading){
                        if emailObj.email.isEmpty{
                            Text("email")
                                .foregroundColor(.white.opacity(0.6))
                        }
                        TextField("",text: $emailObj.email)
                    }
                    .padding(.leading,10)
                        .frame(height: 50)
                        .background(.white.opacity(0.4))
                        .cornerRadius(8)
                        if !emailObj.error.isEmpty{
                        Text(emailObj.error).font(.system(size: 15))
                            .padding(.leading,5)
                            .padding(.trailing,5)
                            .background(Color.white)
                            .foregroundColor(.red)
                            .cornerRadius(4)
                        }
                    }
                    
                    VStack(alignment: .leading,spacing: 4){
                    ZStack(alignment: .leading){
                        if passwordObj.pass.isEmpty{
                            Text("password").foregroundColor(.white.opacity(0.6))
                        }
                        SecureField("",text: $passwordObj.pass)
                    }
                    .padding(.leading,10)
                    .frame(height: 50)
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(8)
                        if !passwordObj.error.isEmpty{
                        Text(passwordObj.error).font(.system(size: 15))
                        .padding(.leading,5)
                        .padding(.trailing,5)
                        .background(Color.white)
                        .foregroundColor(.red)
                        .cornerRadius(4)
                        }
                    }
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
                        doSignUp()
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
