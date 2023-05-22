//
//  ToDoEditViewModel.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/5/20.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import SwiftUI

@MainActor
class ToDoEditViewModel: ObservableObject {
    init() {
    }
    
    func addTask(taskName: String) {
        KoinManager.todoHelper.insertTask(taskName: taskName, completionHandler: {error in
            
        })
    }
}
