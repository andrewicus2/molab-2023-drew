//
//  AnimatingBindings.swift
//  Animations
//
//  Created by drew on 10/24/23.
//

// https://www.hackingwithswift.com/books/ios-swiftui/animating-bindings

import SwiftUI

struct AnimatingBindings: View {
    @State private var animationAmount = 1.0
    
    
    var body: some View {
        print(animationAmount)
        
        return VStack {
            Stepper("Scale Amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
            ), in: 1...10)
            Spacer()
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
    }
}

#Preview {
    AnimatingBindings()
}
