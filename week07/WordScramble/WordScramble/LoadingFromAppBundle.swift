//
//  LoadingFromAppBundle.swift
//  WordScramble
//
//  Created by drew on 10/19/23.
//

import SwiftUI

struct LoadingFromAppBundle: View {
    var body: some View {
        Text("hi")
    }
    
    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            // File was found
            if let fileContents = try? String(contentsOf: fileURL) {
                // loaded file into string
            }
        }
    }
}

#Preview {
    LoadingFromAppBundle()
}
