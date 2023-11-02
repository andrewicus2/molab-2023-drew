//
//  ArchivingSwiftObjectsCodable.swift
//  iExpense
//
//  Created by drew on 11/1/23.
//

// https://www.hackingwithswift.com/books/ios-swiftui/archiving-swift-objects-with-codable

import SwiftUI

struct User2: Codable {
    let firstName: String
    let lastName: String
}

struct ArchivingSwiftObjectsCodable: View {
    @State private var user = User2(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    ArchivingSwiftObjectsCodable()
}
