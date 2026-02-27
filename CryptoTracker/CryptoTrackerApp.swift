//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Cesario Nivar on 2/26/26.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden)
            }
        }
    }
}
