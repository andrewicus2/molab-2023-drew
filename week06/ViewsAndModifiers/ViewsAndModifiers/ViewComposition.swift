//
//  ViewComposition.swift
//  ViewsAndModifiers
//
//  Created by drew on 10/18/23.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.green)
            .clipShape(.capsule)
    }
}

struct ViewComposition: View {
    var body: some View {
        CapsuleText(text: "First")
            .foregroundStyle(.white)
        CapsuleText(text: "Second")
            .foregroundStyle(.yellow)
    }
}

#Preview {
    ViewComposition()
}
