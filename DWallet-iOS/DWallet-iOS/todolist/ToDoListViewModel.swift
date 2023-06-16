//
//  TODOListViewModel.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/6/15.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import common

@MainActor
class TODOListViewModel: ObservableObject {
    @Published var tasks: [ModelTODOTask] = []
    
    init() {
        KoinManager.todoHelper.findAllTasks()
            .subscribe(
                onEach: { tasks in
                    self.tasks = tasks as! [ModelTODOTask]
                },
                onComplete: {},
                onThrow: {error in

                })
//        tasks = [
//            ModelTODOTask(id: 1, title: "Title1", description: "description", createAt: 10000, deadline: 100000, accentColor: 0xFFF79E89),
//            ModelTODOTask(id: 2, title: "Title2", description: "description", createAt: 10000, deadline: 100000, accentColor: 0xFFF76C6A),
//            ModelTODOTask(id: 3, title: "Title3", description: "description", createAt: 10000, deadline: 100000, accentColor: 0xFFF58B70)
//        ]
    }
}
