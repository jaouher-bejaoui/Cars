//
//  PersistenceController.swift
//  Getaround-test
//
//  Created by Jaouher  on 24/06/2024.
//

import CoreData
import Foundation

class PersistenceController: ObservableObject {
  let container = NSPersistentContainer(name: "CarsDatabase")

  static let shared = PersistenceController()

  private init() {
    container.loadPersistentStores { description, error in
      if let error = error {
        print("Core Data failed to load: \(error.localizedDescription)")
      }
    }
  }
}
