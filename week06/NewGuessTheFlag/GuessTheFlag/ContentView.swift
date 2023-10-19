//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Drew Brown on 10/17/23.
//

//  App Storage tutorial: https://www.youtube.com/watch?v=OLyGYcSw9Bs
//  Timer Base Code from: https://github.com/molab-itp/05-TimerDemo/tree/main
//  GuessTheFlag Base Code from: https://www.hackingwithswift.com/100/swiftui

//  TODO: json storage of score history
//  TODO: animation of score plus or minus

import SwiftUI

// Helper struct for repeated view (flag images)

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

// Helper struct for repeated view (score widgets)

struct counterWidget: View {
    var title = ""
    var value = 0
    var type = ""
    
    var body: some View {
        VStack{
            if(type == "Image"){
                Image(systemName:"\(title)")
            } else {
                Text(title)
            }
            Text("\(value)")
                .font(.system(size: 50, weight: .bold))
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
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
    
    // Stored values
    @AppStorage("HIGH_SCORE") var highScore = 0
    @AppStorage("LAST_ATTEMPT") var lastAttempt = 0
    @AppStorage("FIRST_TIME") var firstTime = true

    // Attempt at animation
    @State private var rightAnswer = true
    
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
                            counterWidget(title: "clock", value: timeRemaining, type: "Image")
                            Spacer()
                            counterWidget(title: "checkmark", value: score, type: "Image")

//                            VStack{
//                                Image(systemName:"checkmark")
//                                Text("\(score)")
//                                    .font(.system(size: 50, weight: .bold))
//                                    .foregroundStyle(rightAnswer ? .green : .red)
//                            }
//                            .padding()
//                            .frame(maxWidth: .infinity, maxHeight: 150)
//                            .background(.thinMaterial)
//                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        .frame(maxWidth: .infinity)
                        
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
                                counterWidget(title: "High Score", value: highScore, type: "Text")
                                
                                Spacer()
                                
                                counterWidget(title: "Last Attempt", value: lastAttempt, type: "Text")
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
                                Button(action: {
                                    timerIsRunning = true
                                    gameRunning = true
                                }) {
                                    Text(firstTime ? "Play" : "Play Again")
                                    .frame(maxWidth: .infinity, maxHeight: 49)
                                    .foregroundStyle(.white)
                                    .background(.green)
                                    .cornerRadius(10)
                                    .font(.system(size: 20, weight: .bold))
                                }
                                
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
                }
            }
            .alert("Game Over!", isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    resetGame()
                }
            }
            .navigationTitle("Guess the Flag")
            .navigationBarTitleDisplayMode(gameRunning ? .inline : .large)
        }
    }
    
    func flagTapped(_ number: Int) {
         if number == correctAnswer {
            rightAnswer = true
            score += 1
        
        } else {
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
        askQuestion()
        timeRemaining = 15
        timerIsRunning = false
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
