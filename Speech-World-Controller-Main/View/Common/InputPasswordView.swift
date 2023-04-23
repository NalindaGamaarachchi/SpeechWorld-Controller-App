//
//  InputPasswordView.swift
//  Speech-World-Controller-Main
//
//  Created by Nalinda on 23/2/2023.
//

import SwiftUI

struct InputPasswordView: View {
    @Binding var password: String
    let placeholder: String
    let systemImage: String?
    
    private let textFieldLeading: CGFloat = 30
    var body: some View {
        VStack(alignment:.trailing) {
            HStack(alignment:.center) {
                if let systemImage = systemImage {
                    
                    Image(systemName: systemImage)
                        .font(.system(size: 14, weight: .semibold))
                        .padding(.leading, 5)
                        .foregroundColor(textColor.opacity(0.5))
                }
                
                SecureField(placeholder, text: $password)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                           minHeight: 44,
                           alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            Divider()
             .frame(height: 1)
             .background(textColor)
        }
        .background(backgroundColor)
    }
}

struct InputPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        InputPasswordView(password: .constant(""), placeholder: "password", systemImage: "lock")
            .previewLayout(.sizeThatFits)
    }
}
