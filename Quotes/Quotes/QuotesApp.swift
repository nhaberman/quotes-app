//
//  QuotesApp.swift
//  Quotes
//
//  Created by Nick Haberman on 2/18/24.
//

import SwiftUI
import SwiftData

@main
struct QuotesApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Quote.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false, cloudKitDatabase: .private("iCloud.com.quotes.container"))

        do {
            
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
