//
//  TODOEditScreen.swift
//  DWallet-iOS
//
//  Created by Jin on 2023/6/16.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

@available(iOS 16.0, *)
struct TODOEditScreen: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var showDatePicker = false
    
    @ObservedObject var editViewModel: TODOEditViewModel = TODOEditViewModel()
    
    var body: some View {
        VStack {
            Spacer().frame(height: 32)
            TextField("Title", text: $editViewModel.title)
                .padding(.all)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue, lineWidth: 2)
                }
                .padding(.horizontal)
            TextField("Description", text: $editViewModel.description, axis: .vertical)
                .frame(maxHeight: .infinity, alignment: .topLeading)
                .padding(.all)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue, lineWidth: 2)
                }
                .padding(.horizontal)
                .multilineTextAlignment(.leading)
            TextField("Deadline", text: $editViewModel.deadlineStr)
                .overlay(alignment: .trailing) {
                    Button(action: {
                        showDatePicker = true
                    }, label: {
                        Image(systemName: "calendar")
                    })
                }
                .padding(.all)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue, lineWidth: 2)
                }
                .padding(.horizontal)
            
            Picker("", selection: $editViewModel.accentColor, content: {
                ForEach(AccentColor.allCases, id: \.rawValue) { color in
                    Text(color.rawValue.description).tag(color)
                }
            }).pickerStyle(.automatic)
            Button(action: {
                editViewModel.addTask()
                dismiss()
            }, label: {
                Text("ADD TODO").frame(maxWidth: .infinity)
                    .frame(height: 40)
            }).padding(.all)
                .buttonStyle(.borderedProminent)
        }.sheet(isPresented: $showDatePicker, content: {
            VStack {
                DatePicker(
                    "Deadline",
                    selection: $editViewModel.deadline,
                    displayedComponents: [.date, .hourAndMinute]
                ).datePickerStyle(.graphical)
                Button(action: {
                    showDatePicker = false
                }, label: {
                    Text("DONE").frame(maxWidth: .infinity)
                        .frame(height: 40)
                }).padding(.all)
                    .buttonStyle(.borderedProminent)
            }
        })
    }
}

@available(iOS 16.0, *)
struct TODOEditScreen_Previews: PreviewProvider {
    static var previews: some View {
        TODOEditScreen()
    }
}
