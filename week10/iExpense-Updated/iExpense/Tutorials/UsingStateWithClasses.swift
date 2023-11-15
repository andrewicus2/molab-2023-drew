//
//  UsingStateWithClasses.swift
//  iExpense
//
//  Created by drew on 11/1/23.
//

// https://www.hackingwithswift.com/books/ios-swiftui/using-state-with-classes

import Observation
import SwiftUI

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct UsingStateWithClasses: View {
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
    UsingStateWithClasses()
}
