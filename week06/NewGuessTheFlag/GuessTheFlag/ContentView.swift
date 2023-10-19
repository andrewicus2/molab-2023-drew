//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Drew Brown on 10/5/23.
//

//  App Storage tutorial: https://www.youtube.com/watch?v=OLyGYcSw9Bs
//  Timer Base Code from: https://github.com/molab-itp/05-TimerDemo/tree/main
//  GuessTheFlag Base Code from: https://www.hackingwithswift.com/100/swiftui

import SwiftUI

struct FlagImage: View {
    var imgSrc = ""
    
    var body: some View {
        Image(imgSrc)
            .resizable()
            .renderingMode(.original)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 2)
            .frame(maxWidth: .infinity)
            .aspectRatio(contentMode: .fit)
    }
}


struct ContentView: View {
    // Time remaining in seconds. The source of truth.
    @State var timeRemaining = 15
    
    // Flag for timer state.
    @State var timerIsRunning = false
    @State private var gameRunning = false
    
    // Timer gets called every second.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var showingAlert = false
    
    @AppStorage("HIGH_SCORE") var highScore = 0
    @AppStorage("LAST_ATTEMPT") var lastAttempt = 0
    @AppStorage("FIRST_TIME") var firstTime = true

    @State private var rightAnswer = true
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreBody = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var score = 0;
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color(.white)
                    .ignoresSafeArea()
                VStack {
                    if(gameRunning) {
                        HStack {
                            VStack{
                                Image(systemName:"clock")
                                Text("\(timeRemaining)")
                                    .font(.system(size: 50, weight: .bold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 150)
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            Spacer()
                            VStack{
                                Image(systemName:"checkmark")
                                Text("\(score)")
                                    .font(.system(size: 50, weight: .bold))
                                    .foregroundStyle(rightAnswer ? .green : .red)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 150)
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        .frame(maxWidth: .infinity)
                        

//                        Text("\(scoreTitle)")
//                        Text("\(scoreBody)")
                        
                        
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
                    } else {
                        VStack {
                            HStack {
                                VStack{
                                    Text("High Score")
                                    Text("\(highScore)")
                                        .font(.system(size: 50, weight: .bold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 150)
                                .background(.thinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                Spacer()
                                VStack{
                                    Text("Last Attempt")
                                    Text("\(lastAttempt)")
                                        .font(.system(size: 50, weight: .bold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 150)
                                .background(.thinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                            
                            Spacer()
                            VStack{
                                if(firstTime) {
                                    VStack(alignment: .center, spacing: 20) {
                                        Text("Welcome to Guess the Flag!")
                                            .font(.system(size: 30, weight: .bold))
                                        Text("You will have 15 seconds to identify flags by their images.")
                                        Text("Good luck!")
                                    }
                                    .multilineTextAlignment(.center)
                                } else {
                                    Text("Game Over!")
                                }
                                Button(firstTime ? "Play" : "Play Again") {
                                    timerIsRunning = true
                                    gameRunning = true
                                }
                                .padding()
                                .frame(maxWidth:.infinity)
                                .background(.green)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold))
                            }
                        }
                    }
                }
                .padding(25)
            }
            .onReceive(timer) { _ in
                // Block gets called when timer updates.
                
                // If timeRemaining and timer is running, count down.
                if self.timeRemaining == 0{
                    showingAlert = true
                }
                else if self.timeRemaining > 0 && self.timerIsRunning {
                    self.timeRemaining -= 1
                    
                    print("Time Remaining:", self.timeRemaining)
                }
            }
            .alert("Game Over!", isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    resetGame()
                }
            }
            .navigationTitle("Guess the Flag")
            .navigationBarTitleDisplayMode(gameRunning ? .inline : .large)

            .font(.system(size: 20, design: .rounded))
        }
    }
    
    func flagTapped(_ number: Int) {
         if number == correctAnswer {
            scoreTitle = "Correct"
            scoreBody = "Nice job!"
            rightAnswer = true
            score += 1
        
        } else {
            scoreTitle = "Wrong"
            scoreBody = "You tapped the flag of \(countries[number])"
            rightAnswer = false
            score -= 1
        }
        askQuestion()

    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        timeRemaining = 15
        self.timerIsRunning.toggle()
        gameRunning = false
        lastAttempt = score
        if(lastAttempt > highScore){
            highScore = lastAttempt
        }
        score = 0
        firstTime = false
    }
}



#Preview {
    ContentView()
}
