//
//  ScrollViewTutorial.swift
//  Moonshot
//
//  Created by drew on 11/3/23.
//

// https://www.hackingwithswift.com/books/ios-swiftui/how-scrollview-lets-us-work-with-scrolling-data

import SwiftUI


struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct ScrollTutorial: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText(text: "Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ScrollTutorial()
}
