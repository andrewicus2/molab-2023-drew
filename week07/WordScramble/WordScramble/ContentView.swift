//
//  ContentView.swift
//  WordScramble
//
//  Created by drew on 10/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("hi")
    }
    
    
    func test() {
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        let letter = letters.randomElement()
        
        
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

#Preview {
    ContentView()
}
