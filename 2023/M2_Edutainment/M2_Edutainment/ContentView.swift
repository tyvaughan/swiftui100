//
//  ContentView.swift
//  M2_Edutainment
//
//  Created by  Ty Vaughan on 6/28/23.
//

import SwiftUI

struct Question {
    private(set) var m1: Int
    private(set) var m2: Int
    private(set) var answer: Int
}

struct ContentView: View {
    
    // Settings state
    let numQuestionChoices = [5, 10, 20]
    @State private var numQuestions = 10
    @State private var tables = 2
    
    // Game state
    @State private var isActive = false
    @State private var score = 0
    @State private var curQuestion = 0
    @State private var questions: [Question] = []
    @State private var answer = ""
    
    var body: some View {
        NavigationView {
            if !isActive {
                Form {
                    Section("Up to what tables?") {
                        Stepper("\(tables)", value: $tables, in: 2...12)
                    }
                    Section("How many questions?") {
                        Picker("How many questions?", selection: $numQuestions) {
                            ForEach(numQuestionChoices, id: \.self) {
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                    }
                    Button("Play Game!") {
                        startGame()
                    }
                }
            } else {
                VStack {
                    HStack {
                        Text("\(questions[curQuestion].m1)")
                            .font(.largeTitle)
                        Text("x")
                            .font(.largeTitle)
                        Text("\(questions[curQuestion].m2)")
                            .font(.largeTitle)
                    }
                    
                    TextField("Answer", text: $answer)
                        .keyboardType(.numberPad)
                    
                }
            }
        }
        .padding()
    }
    
    // MARK: - Game Setup
    func startGame() -> Void {
        score = 0
        isActive = true
        generateQuestions()
    }
    
    func endGame() -> Void {
        isActive = false
    }
    
    func generateQuestions() -> Void {
        var questions: [Question] = []
        for _ in 0..<numQuestions {
            let m1 = Int.random(in: 2...tables)
            let m2 = Int.random(in: 2...tables)
            let answer = m1 * m2
            questions.append(Question(m1: m1, m2: m2, answer: answer))
        }
        self.questions = questions
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
