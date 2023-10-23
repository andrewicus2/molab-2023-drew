//
//  SpellChecker.swift
//  WordScramble
//
//  Created by drew on 10/22/23.
//

import SwiftUI

struct SpellChecker: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    
    
    func test() {
        let word  = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let mispelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = mispelledRange.location == NSNotFound
        
    }
}

#Preview {
    SpellChecker()
}
