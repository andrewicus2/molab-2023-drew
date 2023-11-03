//
//  PushNewViewsOnStack.swift
//  Moonshot
//
//  Created by drew on 11/3/23.
//

import SwiftUI

struct PushNewViewsOnStack: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { row in
                NavigationLink("row \(row)") {
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    PushNewViewsOnStack()
}
