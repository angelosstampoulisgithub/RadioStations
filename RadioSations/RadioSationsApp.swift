//
//  RadioSationsApp.swift
//  RadioSations
//
//  Created by Angelos Staboulis on 27/9/24.
//

import SwiftUI
import SwiftData

@main
struct RadioSationsApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,Favorites.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    private var service = RadioStationsAPI(url: URL("https://www.3ds.gr/apptest/stations.json"))
    @State private var networkMonitor = NetworkMonitor()

    var body: some Scene {
        WindowGroup {
            ContentView(container: sharedModelContainer)
                .environment(networkMonitor)
        }
        .modelContainer(sharedModelContainer)
        .environmentObject(ViewModel(radioServices: service))
    }
}
