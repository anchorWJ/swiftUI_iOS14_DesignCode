//
//  SwiftUIApp.swift
//  Shared
//
//  Created by w simple on 2021/02/07.
//

import SwiftUI

@main
struct SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
