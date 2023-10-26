//
//  ExplicitAnimations.swift
//  Animations
//
//  Created by drew on 10/24/23.
//

import SwiftUI

struct ExplicitAnimations: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1.0, y: 0.0, z: 0.0)
        )
    }
}

#Preview {
    ExplicitAnimations()
}
