//
//  ToDoList.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/5/19.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import common

struct ToDoListScreen: View {
    @ObservedObject var todoListViewModel: ToDoListViewModel
    
    var body: some View {
        VStack {
            TopBar(items: ["Category1", "Category2", "Category3"]).padding([.leading, .trailing], 16)
            ForEach(todoListViewModel.todoTasks, id: \.self.id) { item in
                ToDoItemView(isChecked: false, task: item)
            }.padding([.leading, .trailing], 16)
            Spacer()
        }
    }
}

struct ToDoItemView: View {
    @State var isChecked = false
    var task: ModelToDoTask
    var body: some View {
        HStack{
            Toggle(isOn: $isChecked, label: {
                HStack {
                    Text(task.name)
                    Spacer()
                    Text("20:00 - \(task.id)")
                }
            }).toggleStyle(CheckboxToggleStyle())
        }
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 2)
                .frame(width: 25, height: 25)
                .cornerRadius(5.0)
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
            configuration.label
        }
    }
}
