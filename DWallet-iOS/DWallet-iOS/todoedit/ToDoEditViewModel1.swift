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
class ToDoEditViewModel1: ObservableObject {
    init() {
    }
    
    func addTask(taskName: String) {
        let task: ModelTODOTask = ModelTODOTask(id: -1, title: "test", description: "desc", createAt: 1, deadline: 1, accentColor: 1)
        print(task)
        print(taskName)
        KoinManager.todoHelper.insertTask(todoTask: task, completionHandler: {error in
            print(error ?? "insert successful")
        })
    }
}
