//
//  ContentView.swift
//  M1_RockPaperScissors
//
//  Created by  Ty Vaughan on 6/7/23.
//

import SwiftUI

enum RPSMove: Int, CaseIterable {
    case rock, paper, scissors
}

struct ContentView: View {
    private let maxRounds: Int = 10
    
    // Universal game state
    @State private var score: Int = 0
    @State private var round: Int = 1
    @State private var showFinalScore: Bool = false
    
    // Current round state
    @State private var aiMove: RPSMove = .scissors
    @State private var playerShouldWin: Bool = true
    var roundObjectiveMsg: String {
        playerShouldWin ? "Choose the move to win!" : "Choose the move to lose!"
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack(spacing: 20) {
                    Text("You sense the opponent will play...")
                        .font(.title)
                    Text("\(getEmojiFor(move: aiMove))")
                        .font(.system(size: 60))
                }
                Spacer()
                VStack(spacing: 20) {
                    Text(roundObjectiveMsg)
                        .font(.title)
                    HStack {
                        Spacer()
                        MoveButtonView(title: "🪨") {
                            endRound(playersMove: .rock)
                        }
                        Spacer()
                        MoveButtonView(title: "✂️") {
                            endRound(playersMove: .scissors)
                        }
                        Spacer()
                        MoveButtonView(title: "📄") {
                            endRound(playersMove: .paper)
                        }
                        Spacer()
                    }
                }
                Spacer()
                Spacer()
                Spacer()
            }
            .navigationTitle("Rock, Paper, Scissors!")
            .alert("Game over!", isPresented: $showFinalScore) {
                Button("OK", role: .cancel) {
                    newGame()
                }
            } message: {
                Text("You won \(score) out of \(maxRounds)")
            }
        }
        .padding()
    }
    
    init() {
        // Make sure the nav title fits on the screen
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true

        // Start the game
        newGame()
    }
    
    func newGame() {
        score = 0
        round = 1
        playerShouldWin = true
        startRound()
    }
    
    func startRound() {
        round += 1
        playerShouldWin.toggle()
        aiMove = RPSMove.allCases.randomElement()!
    }
    
    func endRound(playersMove: RPSMove) {
        print("Comparing \(aiMove) to \(playersMove)")
        // Check if the player completed the objective
        let isCorrect = playerShouldWin
            ? checkIf(move: playersMove, beats: aiMove)
            : checkIf(move: aiMove, beats: playersMove)
        print("Is correct: \(isCorrect)\n")
        
        // Increase the score
        if isCorrect {
            score += 1
        }
        
        // End game or start next round
        if round >= maxRounds {
            showFinalScore.toggle()
        } else {
            startRound()
        }
    }
    
    func checkIf(move p1Move: RPSMove, beats p2Move: RPSMove) -> Bool {
        print("Does \(p1Move) beat \(p2Move)?")
        if p1Move == p2Move {
            return false
        }
        if (p1Move == .scissors && p2Move == .paper) { return true }
        if (p1Move == .scissors && p2Move == .rock) { return false }
        if (p1Move == .paper && p2Move == .rock) { return true }
        if (p1Move == .paper && p2Move == .scissors) { return false }
        if (p1Move == .rock && p2Move == .scissors) { return true }
        if (p1Move == .rock && p2Move == .paper) { return false }
        return false // Default; should never happen
    }
    
    func getEmojiFor(move: RPSMove) -> String {
        switch move {
        case .scissors:
            return "✂️"
        case .paper:
            return "📄"
        case .rock:
            return "🪨"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
