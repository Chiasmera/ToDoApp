//
//  AddTaskView.swift
//  ToDoApp
//
//  Created by dmu mac 23 on 12/10/2023.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var todoController : TodoController
    @State var title : String
    @State var description: String
    @Binding var isPresented :Bool


    var body: some View {
        VStack {
            Text("New Todo")
                .font(.title2)

            Form {
                Section (content: {
                    TextField("Title", text: $title)
                }, header: {
                    Text("Title")
                })
                Section (content: {
                    TextField("Description", text: $description)
                }, header: {
                    Text("Description")
                })
            }
            HStack {
                Spacer()
                Button {
                    todoController.Add(Todo: Todo(title: title, date: Date(), description: description, location: Coordinate(latitude: todoController.userLocation.latitude, longitude: todoController.userLocation.longitude)))
                    isPresented = false
                } label: {
                    Text("Submit")
                }
                Spacer()
            }
        }
    }
}


