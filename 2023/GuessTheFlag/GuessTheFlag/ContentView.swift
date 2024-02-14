//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by  Ty Vaughan on 5/31/23.
//

import SwiftUI

struct ContentView: View {
    private let maxQuestions = 8
    
    // Animation state
    @State private var pressedFlag: Int? = nil

    // Question state
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var numQuestions = 0
    
    // Score state
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var showingScore = false
    
    // Final score state
    @State private var showingFinalScore = false
    
    var body: some View {
        ZStack {
//            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 600)
            .ignoresSafeArea()
    
            VStack {
                Spacer()
                Text("Gues the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            withAnimation {
                                pressedFlag = number
                            }
                            flagTapped(number)
                        } label: {
                            FlagImage(image: countries[number])
                        }
                        .rotation3DEffect(number == pressedFlag ? .degrees(360) : .degrees(0), axis: (x: 0, y: 1, z: 0))
                        .rotation3DEffect(pressedFlag != nil && number != pressedFlag ? .degrees(360) : .degrees(0), axis: (x: 1, y: 0, z: 0))
                        .scaleEffect(pressedFlag != nil && number != pressedFlag ? 0.5 : 1.0)
                        .opacity(pressedFlag == nil || number == pressedFlag ? 1.0 : 0.25)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .onAppear {
            startNewGame()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(scoreMessage)
        }
        .alert("Good job!", isPresented: $showingFinalScore) {
            Button("Play again", action: startNewGame)
        } message: {
            Text("You answered \(score) out of \(maxQuestions) correctly!")
        }
    }
    
    func startNewGame() {
        score = 0
        numQuestions = 0
        askQuestion()
    }
    
    func askQuestion() {
        // Reset animation state
        pressedFlag = nil
        
        if (numQuestions < maxQuestions) {
            numQuestions += 1
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            scoreMessage = ""
        } else {
            showingFinalScore = true
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct"
            scoreMessage = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong"
            scoreMessage = """
                That's the flag of \(countries[number])!
                Your score is \(score)
                """
        }
        showingScore = true
    }
}

struct FlagImage: View {
    public let image: String
    var body: some View {
        Image(image)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
