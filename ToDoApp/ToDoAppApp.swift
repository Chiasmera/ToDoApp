//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by dmu mac 23 on 12/10/2023.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TodoList().environmentObject(TodoController())
            }
        }
    }
}
