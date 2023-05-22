//
//  TopBar.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/5/19.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct TopBar: View {
    var items: [String]
    @State var selectedItem: String
    
    init(items: [String]) {
        self.items = items
        self.selectedItem = items.first ?? ""
    }
    
    var body: some View {
        HStack {
            Image(systemName: "arrow.down")
            Menu {
                ForEach(items.indices, id: \.self) { index in
                    Button {
                        selectedItem = items[index]
                    } label: {
                        Text(items[index])
                    }
                }
            } label: {
                Label(
                    selectedItem, systemImage: ""
                ).labelStyle(TrailingIconLabelStyle())
            }.frame(maxWidth: .infinity)
            NavigationLink {
                ToDoEditScreen(taskName: "")
            } label: {
                Image(systemName: "plus")
            }
        }
    }
}

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

struct TopBar_Preview: PreviewProvider {
    static var previews: some View {
        TopBar(items: ["Work", "Life"])
    }
}
