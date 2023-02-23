//
//  LoginView.swift
//  Speech-World-Controller-Main
//
//  Created by Nalinda on 23/2/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var showRegistration = false
    @State private var showForgotPassword = false
    
    @StateObject private var viewModel = LoginViewModelImpl(
        service: LoginServiceImpl()
    )
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea(.all)
            
            VStack {
                LoadingScreenImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                
                
                Text("Login")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding()
                
                VStack(spacing: 16) {
                    InputTextFieldView(text: $viewModel.credentials.email,
                                       placeholder: "Email",
                                       keyboardType: .emailAddress,
                                       systemImage: "envelope")
                    
                    InputPasswordView(password: $viewModel.credentials.password,
                                      placeholder: "Password",
                                      systemImage: "lock")
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        showForgotPassword.toggle()
                    }, label: {
                        Text("Forgot Password?")
                    })
                    .font(.system(size: 16, weight: .bold))
                    .sheet(isPresented: $showForgotPassword) {
                            //ForgotPasswordView()
                    }
                }
                
                ButtonView(title: "Login") {
                    viewModel.login()
                }
                
                HStack {
                    Text("New to Speech world?")
                        .padding(.trailing)
                    
                    Button(action: {
                        showRegistration.toggle()
                    }, label: {
                        Text("Register")
                            .font(.system(size: 16, weight: .bold))
                            .sheet(isPresented: $showRegistration) {
                                    //RegisterView()
                            }
                    })
                }
            }
            .padding()
            .alert(isPresented: $viewModel.hasError,
                   content: {
                    
                    if case .failed(let error) = viewModel.state {
                        return Alert(
                            title: Text("Error"),
                            message: Text(error.localizedDescription))
                    } else {
                        return Alert(
                            title: Text("Error"),
                            message: Text("Something went wrong"))
                    }
             })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
