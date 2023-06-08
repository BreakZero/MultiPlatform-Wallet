//
//  ToDoEdit.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/5/20.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct ToDoEditScreen: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var editViewModel: ToDoEditViewModel
    
    @State private var taskName: String
    
    init(taskName: String) {
        self.editViewModel = ToDoEditViewModel()
        self._taskName = State(initialValue: taskName)
    }
    
    var body: some View {
        VStack {
            TextEditor(text: $taskName)
            Button {
                editViewModel.addTask(taskName: taskName)
                dismiss()
            } label: {
                Text("Add Task")
            }

        }
    }
}
