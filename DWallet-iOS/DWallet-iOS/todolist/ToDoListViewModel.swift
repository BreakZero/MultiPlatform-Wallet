//
//  ToDoListViewModel.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/5/19.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import SwiftUI
import common

@MainActor
class ToDoListViewModel: ObservableObject {
    @Published var todoTasks = [ModelToDoTask]()
    
    init() {

        KoinManager.todoHelper.allToDoTask().subscribe(
            onEach: { result in
                self.todoTasks = result as! [ModelToDoTask]
            },
            onComplete: {},
            onThrow: {error in
                
            })
    }
    
    //    init() {
    //        KoinManager.shared.databaseWrapper().selectAllTask().collect(collector: Kotlinx_coroutines_coreFlowCollector) { error in
    //
    //        }
    //    }
    
}
