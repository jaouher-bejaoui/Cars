//
//  Favorites.swift
//  Getaround-test
//
//  Created by Jaouher  on 24/06/2024.
//

import Foundation

class Favorites: ObservableObject {
    // the actual resorts the user has favorited
    private var cars: Set<String>

    // the key we're using to read/write in UserDefaults
    private let key = "Favorites"

    init() {
        // load our saved data

        // still here? Use an empty array
        cars = []
    }

    // returns true if our set contains this resort
    func contains(_ car: Car) -> Bool {
        cars.contains(car.id ?? "")
    }

    // adds the resort to our set and saves the change
    func add(_ car: Car) {
        cars.insert(car.id ?? "")
        save()
    }

    // removes the resort from our set and saves the change
    func remove(_ car: Car) {
        cars.remove(car.id ?? "")
        save()
    }

    func save() {
        // write out our data
    }
}
