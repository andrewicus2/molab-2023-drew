//
//  RunGame.swift
//  MultiplicationTables
//
//  Created by drew on 11/16/23.
//

import SwiftUI

struct RunGame: View {
    @Environment(\.dismiss) var dismiss

    var tableVal: Int
    var numQuestions: Int
    var attempts: Attempts
    
    @State private var multValue = Int.random(in: 2...12)
    @State private var answer = ""
    @State private var score = 0
    @State private var questionNum = 1
    
    @State private var questionAlert = false
    @State private var gameOver = false
    
    @State private var questCorrect = false
    
    var disableForm: Bool {
        answer.count < 1
    }
    
    var body: some View {
        Form {
            Section {
                Text("What is: \(tableVal) x \(multValue)?")
                Text("Question \(questionNum) / \(numQuestions)")
                Text("Score: \(score)")
                
            }
            
            Section {
                TextField("Answer", text: $answer)
                    .keyboardType(.numberPad)
            }
            
            Section {
                Button("Submit") {
                    answerSubmit()
                }
            }
            .disabled(disableForm)
        }
        .alert(questCorrect ? "Correct!" : "Wrong", isPresented: $questionAlert) {
            Button("Next Question") {
                newQuestion()
            }
        } message: {
            Text(questCorrect ? "You got this!" : "The correct answer is \(tableVal * multValue)")
        }
        .alert(questCorrect ? "Correct!" : "Wrong", isPresented: $gameOver) {
            Button("Home") {
                let attempt = AttemptInstance(tableVal: tableVal, numQuestions: numQuestions, score: score)
                
                attempts.items.append(attempt)
                
                dismiss()
            }
        } message: {
            Text("Game over!")
        }
    }
    
    func answerSubmit() {
        if(Int(answer) == tableVal * multValue) {
            score += 1
            questCorrect = true
        } else {
            questCorrect = false
        }
                
        if(questionNum < numQuestions) {
            questionAlert = true
        } else {
            gameOver = true
        }
    }
    
    func newQuestion() {
        answer = ""
        multValue = Int.random(in: 2...12)
        questionNum += 1
    }
}



