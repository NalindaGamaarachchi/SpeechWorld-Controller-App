//
//  InputTextFieldView.swift
//  Speech-World-Controller-Main
//
//  Created by Nalinda on 23/2/2023.
//

import SwiftUI

struct InputTextFieldView: View {
    
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
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
                
                TextField(placeholder, text: $text)
                    .frame(maxWidth: .infinity,
                           minHeight: 44,
                           alignment: .center)
                    .keyboardType(keyboardType)
                    .textInputAutocapitalization(.never)
                
            }
            Divider()
             .frame(height: 1)
             .background(textColor)
        }
        .background(backgroundColor)
        
    }
}

struct InputTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputTextFieldView(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress, systemImage: "envelope")
            .previewLayout(.sizeThatFits)
    }
}
