//
//  ArambyeolApp.swift
//  Arambyeol
//
//  Created by 김가은 on 2022/07/28.
//

import SwiftUI

@main
struct ArambyeolApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
