//
//  ConditionalModifiers.swift
//  ViewsAndModifiers
//
//  Created by drew on 10/18/23.
//

import SwiftUI

struct ConditionalModifiers: View {
    @State private var useRedText = false
    
    var body: some View {
        Button("Hello, world!") {
            useRedText.toggle()
        }
        // W (what to check) T (true value)  F (false value)
        .foregroundStyle(useRedText ? .red : .blue)
        
        // conventional if statement is slower
    }
}

#Preview {
    ConditionalModifiers()
}
