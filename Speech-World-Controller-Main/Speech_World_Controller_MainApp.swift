//
//  Speech_World_Controller_MainApp.swift
//  Speech-World-Controller-Main
//
//  Created by Nalinda on 20/2/2023.
//

import SwiftUI

@main
struct Speech_World_Controller_MainApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
