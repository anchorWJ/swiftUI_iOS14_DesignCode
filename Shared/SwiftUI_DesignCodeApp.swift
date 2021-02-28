//
//  SwiftUI_DesignCodeApp.swift
//  Shared
//
//  Created by w simple on 2021/02/28.
//

import SwiftUI

@main
struct SwiftUI_DesignCodeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
