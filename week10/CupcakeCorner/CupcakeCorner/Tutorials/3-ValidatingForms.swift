//
//  ValidatingForms.swift
//  CupcakeCorner
//
//  Created by drew on 11/15/23.
//

// https://www.hackingwithswift.com/books/ios-swiftui/validating-and-disabling-forms

import SwiftUI

struct ValidatingForms: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create Account") {
                    print(/*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/)
                }
            }
            .disabled(disableForm)
        }
    }
}

#Preview {
    ValidatingForms()
}
