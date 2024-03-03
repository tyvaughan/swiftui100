//
//  ContentView.swift
//  P2_GuessTheFlag_2024
//
//  Created by  Ty Vaughan on 2/19/24.
//

import SwiftUI

struct ContentView: View {
    private let maxQuestions = 10
    
    // Game state
    @State private var score = 0
    @State private var questionNumber = 0
    
    // Game alert state
    @State private var showingGameAlert = false

    // Question state
    @State private var countries = K.countries.shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var selectedAnswer: Int? = nil
    
    // Question alert state
    @State private var showingQuestionAlert = false
    @State private var questionAlertTitle = ""
    @State private var questionAlertMessage = ""
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()

                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    
                    ForEach(0..<3) { number in
                        FlagView(
                            countries: $countries,
                            selectedAnswer: $selectedAnswer,
                            number: number,
                            handler: flagTapped,
                            isAnswer: number == correctAnswer
                        )
                    }
                }
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(questionAlertTitle, isPresented: $showingQuestionAlert) {
            Button("Continue", action: nextQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game Over", isPresented: $showingGameAlert) {
            Button("Play again", action: resetGame)
        } message: {
            Text("Congratulations! You got \(score) out of \(maxQuestions) flags correct!")
        }
    }
    
    /**
        Resets the game state for a new game
     */
    func resetGame() -> Void {
        // reset data to restart the game
        score = 0
        questionNumber = 0
        questionAlertTitle = ""
        questionAlertMessage = ""
        nextQuestion()
    }

    /**
        Updates game state to show the next question or end the game
     */
    func nextQuestion() -> Void {
        selectedAnswer = nil
        if questionNumber == maxQuestions {
            showingGameAlert = true
        } else {
            // set up a new question
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    }
    
    /**
        Handles when a flag button is tapped
     */
    func flagTapped(_ number: Int) -> Void {
        selectedAnswer = number
        if number == correctAnswer {
            questionAlertTitle = "Correct"
            questionAlertMessage = ""
            score += 1
        } else {
            questionAlertTitle = "Wrong"
            questionAlertMessage = "That's the flag for \(countries[number])!"
        }
        questionNumber += 1
        showingQuestionAlert = true
    }

    func getOpacityAmount(_ isOpaque: Bool) -> Double {
        isOpaque ? 1.0 : 0.5
    }
    
    func getSpinAmount(_ showSpin: Bool) -> Double {
        showSpin ? 360 : 0
    }
    
}

#Preview {
    ContentView()
}
