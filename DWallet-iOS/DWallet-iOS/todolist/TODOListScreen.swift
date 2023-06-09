//
//  TODOListScreen.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/6/15.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import common

@available(iOS 16.0, *)
struct TODOListScreen: View {
    @ObservedObject var listViewModel: TODOListViewModel = TODOListViewModel()
    @State private var showAdd: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    AppTopBar(destination: {
                        UserProfileScreen()
                    })
                    FilterView()
                    List(listViewModel.tasks, id: \.self.id) { task in
                        ZStack {
                            NavigationLink(destination: TaskDetailScreen(taskId: task.id), label: {
                                EmptyView()
                            }).listStyle(.inset).opacity(0.0)
                            TaskItemView(task: task)
                        }.listRowInsets(EdgeInsets())
                            .listRowBackground(EmptyView())
                            .listRowSeparator(.hidden)
                    }.listStyle(.inset)
                    
                    Spacer()
                }
                FloatingActionButton(action: {
                    showAdd = true
                }, icon: "plus")
            }.sheet(isPresented: $showAdd, content: {
                TODOEditScreen()
            })
        }
    }
}

struct FilterView: View {
    var body: some View {
        HStack {
            Image("menu")
            Text("LIST OF TODO")
                .font(.system(size: 26))
                .bold()
                .foregroundColor(Color("primary"))
            Spacer()
            Image("filter")
        }.padding(.horizontal, 16)
    }
}

struct TaskItemView: View {
    var task: ModelTODOTask
    var body: some View {
        VStack {
            HStack {
                Text(task.title)
                    .font(.system(size: 24))
                    .bold()
                    .foregroundColor(Color.white)
                    .lineLimit(1)
                Spacer()
            }
            Text(task.description_).frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 22))
                .padding(.vertical, 2)
                .foregroundColor(Color.white)
                .lineLimit(3)
            Text(task.deadline.description)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.white)
        }
        .padding(.all, 8)
        .background(Color(hex: task.accentColor))
        .cornerRadius(12)
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
    }
}

struct TODOTask_Previews: PreviewProvider {
    static var previews: some View {
        TaskItemView(task: ModelTODOTask(id: 1, title: "Title", description: "description", createAt: 10000, deadline: 100000, accentColor: 0xFFF79E89))
    }
}

@available(iOS 16.0, *)
struct TODOListScreen_Previews: PreviewProvider {
    static var previews: some View {
        TODOListScreen()
    }
}
