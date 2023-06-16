//
//  TaskDetailScreen.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/6/16.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct TaskDetailScreen: View {
    @ObservedObject var detailViewModel: TaskDetailViewModel
    init(taskId: Int64) {
        detailViewModel = TaskDetailViewModel(taskId: taskId)
    }
    
    var body: some View {
        VStack {
            Text(detailViewModel.task?.title ?? "")
                .font(.system(size: 24))
                .bold()
                .padding(.horizontal, 16)
                .padding(.top, 4)
                .frame(maxWidth: .infinity,alignment: .leading)
            Text(detailViewModel.task?.description_ ?? "").frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 22))
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
                .frame(maxHeight: .infinity, alignment: .topLeading)
            Text(detailViewModel.task?.deadline.description ?? "Created at Now")
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    Image("edit")
                    Image("delete")
                }
            }
        }
    }
}

struct TaskDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailScreen(taskId: -1)
    }
}
