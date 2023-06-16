//
//  UserProfileViewModel.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/6/15.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import common

@MainActor
class UserProfileViewModel: ObservableObject {
    @Published var userProfile: ModelUserProfile? = nil
    
    init() {
        KoinManager.todoHelper.findUser()
            .subscribe(
                onEach: { userProfile in
                    if userProfile != nil {
                        self.userProfile = userProfile
                    }
                },
                onComplete: {},
                onThrow: {error in}
            )
    }
}
