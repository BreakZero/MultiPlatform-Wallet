//
//  SignInViewModel.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/6/15.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import common

@MainActor
class SignInViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""

    
    func signIn() {
        print("email: \(email), password: \(password)")
        KoinManager.todoHelper.insertUser(
            user: ModelUserProfile(
                uid: Int64.random(in: 0...1000),
                fullName: "Dougie Lu",
                email: email,
                password: password,
                createAt: Date().toMillis()
            ),
            completionHandler: { error in
                if error == nil {
                    print("login successful")
                } else {
                    print("error message: \(error?.localizedDescription ?? "login failed")")
                }
            }
        )
    }
}
