//
//  SignInScreen.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/6/15.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

@available(iOS 16.0, *)
struct SignInScreen: View {
    @State private var signInSuccessful = false
    
    @ObservedObject var signInViewModel: SignInViewModel = SignInViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Image("logo")
            Spacer()
            TextField("Email", text: $signInViewModel.email)
                .padding(.all)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue, lineWidth: 2)
                }
                .padding(.all)
            TextField("Password", text: $signInViewModel.password)
                .overlay(alignment: .trailing) {
                    Image(systemName: "eye")
                }
                .padding(.all)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue, lineWidth: 2)
                }
                .padding(.horizontal)
            Button(
                action: {
                    signInViewModel.signIn()
                    signInSuccessful = true
                },
                label: {
                    Text("SIGN IN")
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                }
            ).padding(.all)
                .buttonStyle(.borderedProminent)
        }.fullScreenCover(isPresented: $signInSuccessful, content: {
            TODOListScreen()
        })
    }
}

@available(iOS 16.0, *)
struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
