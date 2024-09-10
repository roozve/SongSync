//
//  SongSyncApp.swift
//  SongSync
//
//  Created by Rusbeh Turki on 9/6/24.
//
import SwiftUI

@main
struct SongSyncApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SongLibraryView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
