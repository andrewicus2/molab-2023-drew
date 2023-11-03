//
//  CodableData.swift
//  Moonshot
//
//  Created by drew on 11/3/23.
//

// https://www.hackingwithswift.com/books/ios-swiftui/working-with-hierarchical-codable-data

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct CodableData: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Johnny Marker",
                "address": {
                    "street": "1, Cupertino Avenue",
                    "city": "San Francisco"
                }
            }
            """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

#Preview {
    CodableData()
}
