//
//  ContentView.swift
//  iExpense
//
//  Created by drew on 11/1/23.
//

import SwiftUI

@Observable class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ContentView: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("First name", text: $user.lastName)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
