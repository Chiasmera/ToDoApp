//
//  TodoController.swift
//  ToDoApp
//
//  Created by dmu mac 23 on 12/10/2023.
//

import Foundation
import CoreLocation


class TodoController : ObservableObject {
    @Published var todos : [Todo] = []
    let storage = StorageService()
    let updates = CLLocationUpdate.liveUpdates()
    @Published var userLocation : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    private let locationManager = CLLocationManager()

    init() {
        readTodos()

        //For testing purposes only
//        todos.append(Todo(title: "test a todo", date: Date(), description: "this is a test description", location: Coordinate(latitude: 0.0, longitude: 0.0)))
//        writeTodos()
//        readTodos()
        requestAuthorization()
        startGetingUserLocation()

    }

    func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }

    func readTodos () {
        let filename = "Todos.txt"
        guard let todoData = storage.read(file: filename) else {return}
        do {
            todos = try JSONDecoder().decode([Todo].self, from: todoData)
        } catch {
            print("failed decoding todos")
        }

    }

    func writeTodos () {
        let filename = "Todos.txt"
        do {
            let encodedData = try JSONEncoder().encode(todos)
            storage.write(data: encodedData, toFile: filename)
        } catch {
            print("failed encoding todos")
        }

    }

    func removeAt(IndexSet: IndexSet) {
        todos.remove(atOffsets: IndexSet)
        writeTodos()
    }

    func Add(Todo: Todo) {
        todos.append(Todo)
        writeTodos()
    }


    func startGetingUserLocation ()  {
        print("wtf")
        Task {
            for try await update in CLLocationUpdate.liveUpdates() {
                guard let coordinates = update.location?.coordinate else {return}
                Task.detached { @MainActor in
                    self.userLocation = coordinates
                }

                if update.isStationary {
                    break
                }
            }
        }
    }
}
