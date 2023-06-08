//
//  ToDoEditViewModel.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/5/20.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import common

@MainActor
class ToDoEditViewModel: ObservableObject {
    init() {
    }
    
    func addTask(taskName: String) {
        let task: ModelToDoTask = ModelToDoTask(id: -1, name: taskName, color: 0xff123456, duration: 24, start: 12, state: false)
        print(task)
        print(taskName)
        KoinManager.todoHelper.insertTask(todoTask: task, completionHandler: {error in
            print(error ?? "insert successful")
        })
    }
}
