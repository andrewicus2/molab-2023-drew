//
//  ContentView.swift
//  Moonshot
//
//  Created by drew on 11/2/23.
//

// TODO: https://www.hackingwithswift.com/books/ios-swiftui/moonshot-wrap-up

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var showingList = false;
    
    var body: some View {
        NavigationStack{
            Group {
                if showingList {
                    ListView(astronauts: astronauts, missions: missions)
                } else {
                    GridView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem {
                    Button {
                        showingList.toggle()
                    } label: {
                        Image(systemName: showingList ? "square.grid.3x3" : "list.bullet")
                            .foregroundStyle(.white.opacity(0.5))
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
