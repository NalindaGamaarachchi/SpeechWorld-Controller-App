//
//  ButtonView.swift
//  Speech-World-Controller-Main
//
//  Created by Nalinda on 23/2/2023.
//

import SwiftUI

struct ButtonView: View {
    typealias ActionHandler = () -> Void
    
    let title: String
    let background: Color
    let foreground: Color
    let border: Color
    let handler: ActionHandler
    
    private let cornerRadius: CGFloat = 15
    
    internal init(title: String,
                  background: Color = primaryColor,
                  foreground: Color = buttonTextColor,
                  border: Color = .clear,
                  handler: @escaping ButtonView.ActionHandler) {
        self.title = title
        self.background = background
        self.foreground = foreground
        self.border = border
        self.handler = handler
    }
    
    var body: some View {
        Button(action: {
            handler()
        }, label: {
            Text(title)
                .padding()
                .frame(maxWidth: .infinity)
                
        })
        .background(background)
        .foregroundColor(foreground)
        .font(.system(size: 25))
        .cornerRadius(cornerRadius)
        .fontWeight(.semibold)
        .shadow(color: textColor.opacity(0.2), radius: 5, x: 5, y: 5)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "test", handler: {})
            .previewLayout(.sizeThatFits)
            
    }
}
