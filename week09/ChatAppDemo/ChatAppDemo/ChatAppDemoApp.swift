//
//  ChatAppDemoApp.swift
//  ChatAppDemo
//
//  Created by drew on 11/9/23.
//

import SwiftUI
import Firebase

@main
struct ChatAppDemoApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
