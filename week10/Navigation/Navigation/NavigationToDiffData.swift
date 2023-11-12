//
//  NavigationToDiffData.swift
//  Navigation
//
//  Created by drew on 11/11/23.
//

// https://www.hackingwithswift.com/books/ios-swiftui/navigating-to-different-data-types-using-navigationpath

import SwiftUI

struct NavigationToDiffData: View {
    @State private var path = NavigationPath()
    
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }
                
                Button("Push Hello") {
                    path.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You Selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You Selected the string \(selection)")
            }
        }
    }
}

#Preview {
    NavigationToDiffData()
}
