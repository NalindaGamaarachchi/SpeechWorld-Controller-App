//
//  RegistrationView.swift
//  Speech-World-Controller-Main
//
//  Created by Nalinda on 1/3/2023.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = RegistrationViewModelImpl(
           service: RegistrationServiceImpl()
       )
    var body: some View {

            NavigationView {
                
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {

                        LoadingScreenImage
                            .resizable()
                            .frame(width: 250, height: 250)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                        
                        
                        Text("SignUp")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                        
                        VStack(spacing: 16) {
                            InputTextFieldView(text: $viewModel.newUser.email,
                            placeholder: "Email",
                            keyboardType: .emailAddress,
                            systemImage: nil)
                                            
                            InputPasswordView(password: $viewModel.newUser.password,
                            placeholder: "Password",
                            systemImage: nil)
                        
                            InputTextFieldView(text: $viewModel.newUser.firstName,
                            placeholder: "First Name",
                            keyboardType: .namePhonePad,
                            systemImage: nil)
                                            
                            InputTextFieldView(text: $viewModel.newUser.lastName,
                            placeholder: "Last Name",
                            keyboardType: .namePhonePad,
                            systemImage: nil)
                                            
                            InputTextFieldView(text: $viewModel.newUser.occupation,
                            placeholder: "Occupation",
                            keyboardType: .namePhonePad,
                            systemImage: nil)
                        }
                        .padding()
                        
                        ButtonView(title: "Sign up") {
                            viewModel.create()
                        }
                        .padding()
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(backgroundColor)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: Button(action : {dismiss()}){
                                    Image(systemName: "arrow.left")
                })
                }
                
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

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
