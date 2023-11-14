//
//  CustomizingTheNavBar.swift
//  Navigation
//
//  Created by drew on 11/13/23.
//

// https://www.hackingwithswift.com/books/ios-swiftui/customizing-the-navigation-bar-appearance

import SwiftUI

struct CustomizingTheNavBar: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    CustomizingTheNavBar()
}
