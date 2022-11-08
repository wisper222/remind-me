//
//  RemindMe2App.swift
//  RemindMe2
//
//  Created by Alex Garay on 18/10/2021.
//

import SwiftUI

@main
struct RemindMe2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
