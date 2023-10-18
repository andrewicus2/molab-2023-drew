//
//  PropertyViews.swift
//  ViewsAndModifiers
//
//  Created by drew on 10/18/23.
//

import SwiftUI

struct PropertyViews: View {
    var motto1: some View {
        Text("Draco dormiens")
    }
    
    let motto2 = Text("nunquam titillandus")
    
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    PropertyViews()
}
