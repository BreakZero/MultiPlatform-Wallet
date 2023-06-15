//
//  UserManager.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/6/15.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import common

class UserManager: NSObject, ObservableObject {
    @Published var loggedUser: ModelUserProfile? = nil
    static let shared = UserManager()
    
    override private init() {
        HelperKt.doInitKoin()
        super.init()
        
        KoinManager.todoHelper.findUser().subscribe(
            onEach: { user in
                self.loggedUser = user
            },
            onComplete: {},
            onThrow: {error in}
        )
    }
}
