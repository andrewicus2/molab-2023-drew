//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Drew Brown on 10/5/23.
//

import SwiftUI

struct FlagImage: View {
    var imgSrc = ""
    
    var body: some View {
        Image(imgSrc)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreBody = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var questionNum = 0;
    @State private var gameEnd = false;
    
    @State private var score = 0;
    
    var body: some View {
        ZStack {
            AngularGradient(
            stops: [
                Gradient.Stop(color: Color(red: 0.33, green: 0.71, blue: 0.97), location: 0.00),
                Gradient.Stop(color: Color(red: 1, green: 0.68, blue: 0.5), location: 0.37),
                Gradient.Stop(color: Color(red: 0.33, green: 0.71, blue: 0.96), location: 0.68),
                Gradient.Stop(color: Color(red: 1, green: 0.68, blue: 0.51), location: 1.00),
            ], center: UnitPoint(x: 0.5, y: 0.5), angle: Angle(degrees: 90))
                .ignoresSafeArea()
                .blur(radius: 50)
                
            Rectangle()
                .frame(width: .infinity, height: .infinity)
                .foregroundStyle(.white.opacity(0.1))
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                Text("Question: \(questionNum+1)/8")
                    .foregroundStyle(.white)
                
                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(imgSrc: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding(25)
        }
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Next Question", action: askQuestion)
        } message: {
            Text("""
            \(scoreBody)
            Your score is \(score)
            """)
        }
        
        .alert("Game over!", isPresented: $gameEnd) {
            Button("Play again", action: resetGame)
        } message: {
            Text("Thanks for playing! Your final score was \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if questionNum == 7 {
            gameEnd = true;
        } else {
            if number == correctAnswer {
                scoreTitle = "Correct"
                scoreBody = "Nice job!"
                score += 1
                questionNum += 1
            } else {
                scoreTitle = "Wrong"
                scoreBody = "You tapped the flag of \(countries[number])"
                score -= 1
                questionNum += 1
            }
            
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        score = 0
        questionNum = 0
    }
}

#Preview {
    ContentView()
}
