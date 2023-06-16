//
//  TODOEditViewModel.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/6/16.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import common

@MainActor
class TODOEditViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var deadline: Date = Date()
    @Published var accentColor = AccentColor.PRIMARY
    @Published var deadlineStr: String = ""
    
    lazy var deadlinePublisher: Published<String>.Publisher = $deadlineStr
    
    let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "HH:mm E, d MMM y"
        $deadline.map {
            print("===== \($0.toMillis() ?? 0)")
            let result = self.dateFormatter.string(from: $0)
            print("====== \(result)")
            return result
        }.assign(to: &$deadlineStr)
    }
    
    func addTask() {
        print("title: \(title), desc: \(description), deadline: \(deadlineStr), accentColor: \(accentColor)")
        let task: ModelTODOTask = ModelTODOTask(
            id: -1,
            title: title,
            description: description,
            createAt: Date().toMillis(),
            deadline: deadline.toMillis(),
            accentColor: Int64(accentColor.rawValue)
        )
        KoinManager.todoHelper.insertTask(todoTask: task, completionHandler: {error in
            print(error ?? "insert successful")
        })
    }
}
