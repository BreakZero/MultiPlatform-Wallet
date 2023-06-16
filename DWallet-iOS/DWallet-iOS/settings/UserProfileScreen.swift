//
//  UserProfileScreen.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/6/15.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct UserProfileScreen: View {
    @ObservedObject var profileViewModel: UserProfileViewModel = UserProfileViewModel()
    var body: some View {
        VStack {
            Spacer()
            Image("rafiki")
            Spacer()
            ProfileInfoItemView(key: "Full Name", value: profileViewModel.userProfile?.fullName ?? "")
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
            ProfileInfoItemView(key: "Email", value: profileViewModel.userProfile?.email ?? "")
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
            ProfileInfoItemView(key: "Password", value: "Change Password")
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
            
            Button(action: {
                
            }, label: {
                Text("LOG OUT")
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
            }).padding(.all)
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ProfileInfoItemView: View {
    var key: String
    var value: String
    var body: some View {
        HStack {
            Text(key)
            Spacer()
            Text(value).foregroundColor(Color("primary"))
        }
    }
}

struct UserProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileScreen()
    }
}
