//
//  UserDefaults.swift
//  iExpense
//
//  Created by drew on 11/1/23.
//

import SwiftUI

struct UserDefaultsStorage: View {
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        
//            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
    
}

#Preview {
    UserDefaultsStorage()
}
