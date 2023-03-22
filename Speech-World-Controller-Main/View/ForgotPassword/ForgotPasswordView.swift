//
//  ForgotPasswordView.swift
//  Speech-World-Controller-Main
//
//  Created by Nalinda on 5/3/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var viewModel = ForgotPasswordViewModelImpl(
            service: ForgotPasswordServiceImpl()
        )
    
    var body: some View {
        VStack(spacing: 16) {
            InputTextFieldView(text: $viewModel.email,
                                placeholder: "Email",
                                keyboardType: .emailAddress,
                                systemImage: "envelope")
                        
            ButtonView(title: "Send Password Reset") {
                    viewModel.sendPasswordResetRequest()
            }
        }
        .padding()
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {dismiss()}){
                        Image(systemName: "arrow.left")
    })
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
