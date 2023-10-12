//
//  DetailMapView.swift
//  ToDoApp
//
//  Created by dmu mac 23 on 12/10/2023.
//

import SwiftUI
import MapKit

struct DetailMapView: View {
    let todo: Todo

    var body: some View {
        Map {
            Marker (todo.title, coordinate: CLLocationCoordinate2D(latitude: todo.location.latitude, longitude: todo.location.longitude)
            )
        }
    }
}

#Preview {
    DetailMapView(todo: Todo(title: "test", date: Date(), description: "hej", location: Coordinate(latitude: 0.0, longitude: 0.0)))
}
