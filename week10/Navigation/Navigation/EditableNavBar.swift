//
//  EditableNavBar.swift
//  Navigation
//
//  Created by drew on 11/13/23.
//

import SwiftUI

struct EditableNavBar: View {
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EditableNavBar()
}
