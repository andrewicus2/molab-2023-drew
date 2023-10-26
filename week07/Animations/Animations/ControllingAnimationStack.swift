//
//  ControllingAnimationStack.swift
//  Animations
//
//  Created by drew on 10/25/23.
//

// https://www.hackingwithswift.com/books/ios-swiftui/controlling-the-animation-stack

import SwiftUI

struct ControllingAnimationStack: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(nil, value: enabled)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.9), value: enabled)
    }
}

#Preview {
    ControllingAnimationStack()
}
