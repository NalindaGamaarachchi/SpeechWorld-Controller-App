//
//  OnBoardView.swift
//  Speech-World-Controller-Main
//
//  Created by Nalinda on 23/2/2023.
//

import SwiftUI

struct OnBoardView: View {
    var body: some View {
        ZStack {
            primaryColor.ignoresSafeArea(.all)
            VStack {
                Text("Change your \nkid’s life")
                    .foregroundColor(Color.black)
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                OnbordImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                    .padding(.bottom)
                
                
                Button {
                    //
                } label: {
                    HStack {
                        Text("Get started")
                            
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                        Image(systemName:"arrow.right.circle.fill")
                            .font(.system(size: 35))

                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(35)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                }

            }
        }
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView()
    }
}
