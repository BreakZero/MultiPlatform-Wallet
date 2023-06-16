//
//  TaskDetailViewModel.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/6/16.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import common

@MainActor
class TaskDetailViewModel: ObservableObject {
    @Published var task: ModelTODOTask? = nil
    
    init(taskId: Int64) {
        KoinManager.todoHelper.findTaskById(id: taskId)
            .subscribe(
                onEach: { task in
                    if task != nil {
                        self.task = task
                    }
                },
                onComplete: {},
                onThrow: { error in
                    
                }
            )
    }
}
