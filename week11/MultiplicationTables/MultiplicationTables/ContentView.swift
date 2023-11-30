//
//  ContentView.swift
//  MultiplicationTables
//
//  Created by drew on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var attempts = Attempts()

    @State private var tableVal = 2
    @State private var numQuestions = 5
    let questionOptions = [5, 10, 15, 20]
    
        
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Stepper("Value: \(tableVal)", value: $tableVal, in: 2...12)
                    Picker("Number of Questions", selection: $numQuestions) {
                        ForEach(questionOptions, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                
                Section {
                    NavigationLink("Start Game", destination: RunGame(tableVal: tableVal, numQuestions: numQuestions, attempts: attempts))
                }
                
                Section {
                    ForEach(attempts.items) { attempt in
                        VStack {
                            Text("Score: \(attempt.score)")
                        }
                    }
                } header: {
                    Text("Previous Attempts")
                }
            }
            .navigationTitle("Tables")
        }
    }
}

#Preview {
    ContentView()
}
