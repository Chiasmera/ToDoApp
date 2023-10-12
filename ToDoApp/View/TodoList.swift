//
//  ContentView.swift
//  ToDoApp
//
//  Created by dmu mac 23 on 12/10/2023.
//

import SwiftUI

struct TodoList: View {
    @EnvironmentObject var todoController : TodoController
    @State var showSheet = false

    var body: some View {
        List {
            ForEach (todoController.todos) { todo in
                NavigationLink (destination: DetailMapView(todo: todo).environmentObject(todoController)) {
                    Text(todo.title )
                }

            }.onDelete(perform: { indexSet in
                withAnimation {
                    todoController.removeAt(IndexSet: indexSet)
                }
            })
        }
        .navigationTitle("Todo list")
        .toolbar(content: {
            Button(action: {
                showSheet = true
            }, label: {
                Text("Add")
            })
        })
        .sheet(isPresented: $showSheet, content: {
            AddTaskView(title: "", description: "", isPresented: $showSheet)
                .presentationDetents([.height(350), .medium, .large])

        })
    }
}

#Preview {
    TodoList().environmentObject(TodoController())
}
