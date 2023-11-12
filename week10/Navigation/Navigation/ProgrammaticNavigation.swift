//
//  ProgrammaticNavigation.swift
//  Navigation
//
//  Created by drew on 11/11/23.
//

import SwiftUI

struct ProgrammaticNavigation: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }
                Button("show 64") {
                    path.append(64)
                }
                
                Button("Show 32 then 64")  {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ProgrammaticNavigation()
}
