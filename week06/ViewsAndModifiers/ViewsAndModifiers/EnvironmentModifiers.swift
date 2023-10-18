//
//  EnvironmentModifiers.swift
//  ViewsAndModifiers
//
//  Created by drew on 10/18/23.
//

import SwiftUI

struct EnvironmentModifiers: View {
    var body: some View {
        VStack {
            Text("Pie")
                .font(.largeTitle) // local override
            Text("Pie")
            Text("Pie")
            Text("Pie")
        }
        .font(.title) // environment modifier
    }
}

#Preview {
    EnvironmentModifiers()
}
