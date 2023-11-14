//
//  PlacingNavBarButtons.swift
//  Navigation
//
//  Created by drew on 11/13/23.
//

// https://www.hackingwithswift.com/books/ios-swiftui/placing-toolbar-buttons-in-exact-locations

import SwiftUI

struct PlacingNavBarButtons: View {
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .toolbar {
                    ToolbarItemGroup(placement: .topBarLeading) {
                        Button("Tap Me") {
                            // button action
                        }
                        Button("Tap Me") {
                            // button action
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Or Tap Me") {
                            // button action
                        }
                    }
                }
//                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    PlacingNavBarButtons()
}
