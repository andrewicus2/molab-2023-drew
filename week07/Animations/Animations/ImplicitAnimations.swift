//
//  ImplicitAnimations.swift
//  Animations
//
//  Created by drew on 10/24/23.
//

import SwiftUI

struct ImplicitAnimations: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)
        
        // value tells you what will animate, otherwise everything on the screen would
        
//        .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
        
//        .animation(.easeInOut(duration: 2), value: animationAmount)
        
//        .animation(
//            .easeInOut(duration: 2)
//                .delay(1),
//            value: animationAmount
//        )
        
//        .animation(
//            .easeInOut(duration: 2)
//                .repeatCount(3, autoreverses: true),
//            value: animationAmount
//        )
    }
}

#Preview {
    ImplicitAnimations()
}
