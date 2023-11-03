//
//  ResizingImages.swift
//  Moonshot
//
//  Created by drew on 11/2/23.
//

// https://www.hackingwithswift.com/books/ios-swiftui/resizing-images-to-fit-the-available-space

import SwiftUI

struct ResizingImages: View {
    var body: some View {
        Image(.example)
            .resizable()
            .scaledToFill()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.9
            }
            .clipped()
    }
}

#Preview {
    ResizingImages()
}
