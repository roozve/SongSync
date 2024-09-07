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
    
    init() {
        let viewContext = persistenceController.container.viewContext
        let testRecording = RecordingEntity(context: viewContext)
        testRecording.id = UUID()
        testRecording.name = "Test Recording"
        testRecording.fileURL = URL(fileURLWithPath: "/test/path")
        testRecording.date = Date()
        
        do {
            try viewContext.save()
        } catch {
            print("Failed to save test data: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SongLibraryView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
