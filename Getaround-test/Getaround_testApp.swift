//
//  Getaround_testApp.swift
//  Getaround-test
//
//  Created by Jaouher  on 20/06/2024.
//

import SwiftUI

@main
struct Getaround_testApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
