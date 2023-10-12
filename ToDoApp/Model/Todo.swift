//
//  Todo.swift
//  ToDoApp
//
//  Created by dmu mac 23 on 12/10/2023.
//

import Foundation
import MapKit

struct Todo : Codable, Identifiable {
    let id = UUID().uuidString
    let title: String
    let date: Date
    let description: String
    let location : Coordinate
}

struct Coordinate : Codable {
    let latitude : Double
    let longitude : Double
}
