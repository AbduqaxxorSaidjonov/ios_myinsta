//
//  SignInScreen.swift
//  ios_myinsta
//
//  Created by Abduqaxxor on 10/5/22.
//

import SwiftUI

struct SignInScreen: View {
    
    @ObservedObject var viewModel = SignInViewModel()
    @State var isLoading = false
   @ObservedObject var emailObj = EmailValidationObj()
    @ObservedObject var passwordObj = PasswordValidationObj()
    
    func doSignIn(){
        viewModel.apiSignIn(email: emailObj.email, password: passwordObj.pass, completion:{result in
            if !result{
                //when error show dialog and toast
            }
        })
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Utils.color1,Utils.color2]), startPoint: .top, endPoint: .bottom)
                
                VStack(spacing: 10){
                    Spacer()
                    Text("Instagram").foregroundColor(.white)
                        .font(Font.custom("Billabong",size: 45))

                    VStack(alignment: .leading,spacing: 4){
                    ZStack(alignment: .leading){
                        if emailObj.email.isEmpty{
                            Text("Email").foregroundColor(.white.opacity(0.6))
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
                            Text("Password").foregroundColor(.white.opacity(0.6))
                        }
                        SecureField("",text: $passwordObj.pass)
                    }
                    .padding(.leading,10)
                    .frame(height: 50)
                    .background(.white.opacity(0.4))
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
                    Button(action: {
                        doSignIn()
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
                if viewModel.isLoading {
                    ProgressView()
                }
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
