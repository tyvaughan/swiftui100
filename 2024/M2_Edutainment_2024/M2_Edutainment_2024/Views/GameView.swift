//
//  GameView.swift
//  M2_Edutainment_2024
//
//  Created by  Ty Vaughan on 3/2/24.
//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode

    @FocusState private var fieldIsFocused: Bool

    @State public var questions: [Question]

    @State private var score: Int = 0
    @State private var currentQuestion = 0
    @State private var answer = 0
    
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                HStack {
                    ZStack {
                        Rectangle()
                            .fill(.red.gradient)
                            .frame(width: 80, height: 100)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.black, lineWidth: 2)
                            )
                        Text("\(questions[currentQuestion].n1)")
                            .font(.system(size: 32))
                            .foregroundStyle(.white)
                    }
                    Image(systemName: "multiply")
                        .font(.system(size: 32))
                    ZStack {
                        Rectangle()
                            .fill(.red.gradient)
                            .frame(width: 80, height: 100)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.black, lineWidth: 2)
                            )
                        Text("\(questions[currentQuestion].n2)")
                            .font(.system(size: 32))
                            .foregroundStyle(.white)
                    }
                    Image(systemName: "equal")
                        .font(.system(size: 32))
                }
                Spacer()
                TextField("Answer", value: $answer, format: .number)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .submitLabel(.done)
                    .onSubmit {
                        answerQuestion()
                    }
                    .focused($fieldIsFocused)
                Spacer()
                Spacer()
                Text("Score: \(score)")
                Spacer()
            }
            .onAppear {
                startGame()
            }
            .alert(alertTitle, isPresented: $showAlert) {
                Button("Done") {
                    presentationMode.wrappedValue.dismiss()
                    answerQuestion()
                }
            } message: {
                Text(alertMessage)
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        fieldIsFocused = false
                        answerQuestion()
                    }
                }
            }
        }
    }
    
    func startGame() {
        score = 0
        currentQuestion = 0
        answer = 0
    }
    
    func answerQuestion() {
        if answer == questions[currentQuestion].a {
            score += 1
        }
        nextQuestion()
    }

    func nextQuestion() {
        if currentQuestion < questions.count-1 {
            currentQuestion += 1
            answer = 0
        } else {
            endGame()
        }
    }

    func endGame() {
        alertTitle = "Game Over!"
        alertMessage = "You got \(score) questions correct!"
        showAlert = true
    }

}

#Preview {
    let questions = [
        Question(n1: 5, n2: 8, a: 40),
        Question(n1: 5, n2: 3, a: 15),
        Question(n1: 5, n2: 4, a: 20),
        Question(n1: 5, n2: 12, a: 60),
        Question(n1: 5, n2: 1, a: 5)
    ]
    
    return GameView(
        questions: questions
    )
}
