//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by drew on 11/3/23.
//

// https://www.hackingwithswift.com/guide/ios-swiftui/2/3/challenge

import SwiftUI


struct actionButton: View {
    var title = ""
    
    var body: some View {
        Text(title)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.thinMaterial)
            .font(.system(size: 60))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ContentView: View {
    let emojiMoves = ["🪨", "📄", "✂️"]
    let moves = ["Rock", "Paper", "Scissors"]
    let winningMoves = ["Paper", "Scissors", "Rock"]
    
    @State private var gameChoice = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    
    @State private var playerChoice = 0
    @State private var score = 0
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @State private var qNum = 1
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            Text("Choose what")
                .foregroundStyle(.secondary)
                .font(.subheadline)
            Text(shouldWin ? "Beats" : "Loses against")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("\(emojiMoves[gameChoice])")
                .font(.system(size: 150))
            Spacer()
        }
        
        Spacer()
        
        VStack(spacing: 5) {
            HStack {
                Spacer()
                VStack {
                    Text("Question")
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                    Text("\(qNum) / 10")
                        .font(.title)
                        .fontWeight(.bold)
                }
                Spacer()
                VStack {
                    Text("Points")
                        .foregroundStyle(.secondary)
                        .font(.subheadline)
                    Text("\(score)")
                        .font(.title)
                        .fontWeight(.bold)
                }
                Spacer()
            }
            
            Spacer()
            
            Button(action: {
                playerChoice = 0
                runGame(chose: playerChoice)
            }) {
                actionButton(title: "🪨")
            }
            Button(action: {
                playerChoice = 1
                runGame(chose: playerChoice)
            }) {
                actionButton(title: "📄")
            }
            Button(action: {
                playerChoice = 2
                runGame(chose: playerChoice)
            }) {
                actionButton(title: "✂️")
            }
        }
        .padding()
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Got it!")))
        }
    }
    
    
    func runGame(chose: Int) {
        if(moves[playerChoice] == moves[gameChoice]){
            alertTitle = "Tie!"
            alertMessage = "You tied, no change in points."
        }
        else if(shouldWin && moves[playerChoice] == winningMoves[gameChoice]) {
            score += 1
            alertTitle = "Correct!"
            alertMessage = "\(moves[playerChoice]) beats \(moves[gameChoice])"
        } else if(!shouldWin && moves[playerChoice] != winningMoves[gameChoice]) {
            score += 1
            alertTitle = "Correct!"
            alertMessage = "\(moves[playerChoice]) does not beat \(moves[gameChoice])"
        } else if(shouldWin) {
            score -= 1
            alertTitle = "Wrong"
            alertMessage = "\(moves[playerChoice]) does not beat \(moves[gameChoice])"
        } else {
            score -= 1
            alertTitle = "Wrong"
            alertMessage = "\(moves[playerChoice]) beats \(moves[gameChoice])"
        }
        
        
        if(qNum == 10) {
            alertTitle = "Game Over!"
            alertMessage = "Your score was \(score)"
            showingAlert = true;
        }
        
        gameChoice = Int.random(in: 0..<3)
        shouldWin.toggle()
        qNum += 1
    }
}

#Preview {
    ContentView()
}
