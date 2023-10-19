//
//  ContentView.swift
//  WordScramble
//
//  Created by drew on 10/18/23.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        List {
            Section("Section 1") {
                Text("Static Row 1")
                Text("Static Row 2")
            }
            Section("Section 2") {
                ForEach(0..<5) {
                    Text("Dynamic Row \($0)")
                }
                Text("Static Row 2")
            }
            Section("People") {
                ForEach(people, id: \.self) {
                    Text($0)
                }
            }
        }
        .listStyle(.grouped)
    }
}

#Preview {
    ContentView()
}
