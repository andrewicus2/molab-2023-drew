//
//  ScrollingGridLayout.swift
//  Moonshot
//
//  Created by drew on 11/3/23.
//

// https://www.hackingwithswift.com/books/ios-swiftui/how-to-lay-out-views-in-a-scrolling-grid

import SwiftUI

struct ScrollingGridLayout: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    ScrollingGridLayout()
}
