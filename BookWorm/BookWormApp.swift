//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Garrett Keyes on 12/8/25.
//

import SwiftUI
import SwiftData

@main
struct BookWormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
