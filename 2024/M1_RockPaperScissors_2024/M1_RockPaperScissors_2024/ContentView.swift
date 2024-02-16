//
//  ContentView.swift
//  M1_RockPaperScissors_2024
//
//  Created by  Ty Vaughan on 2/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var bgColors = K.colors.shuffled()
    
    @State private var maxRounds = 3
    @State private var numRound = 1
    @State private var score = 0
    @State private var cpuChoice: Move = Move.allCases.randomElement()!
    @State private var shouldWin = Bool.random()
    
    @State private var moveAlertIsPresented = false
    @State private var moveAlertTitle = ""
    @State private var moveAlertMessage = ""
    
    @State private var gameOverAlertIsPresented = false
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()

            Text(shouldWin ? "Beat the CPU!" : "Lose to the CPU!")
                .font(.title)

            VStack {
                Text("The CPU is choosing:")
                Text(cpuChoice.rawValue)
                    .font(.system(size: 48))
            }
            .padding(20)
            .background(bgColors.randomElement()!)
            .cornerRadius(32)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 8)

            HStack {
                ForEach(0..<Move.allCases.count, id: \.self) { i in
                    MoveButton(color: bgColors[i], move: Move.allCases[i], onClick: makeMove)
                }
            }
            
            Spacer()
            
            Text("Score: \(score)")
            
            Spacer()
            Spacer()
        }
        .padding()
        .alert(moveAlertTitle, isPresented: $moveAlertIsPresented) {
            Button("Next round") {
                nextRound()
            }
        } message: {
            Text(moveAlertMessage)
        }
        .alert("Game over!", isPresented: $gameOverAlertIsPresented) {
            Button("Play again!") {
                newGame()
            }
        } message: {
            Text("Your final score is \(score)!")
        }
    }
    
    func newGame() -> Void {
        numRound = 0
        score = 0
        nextRound()
    }
    
    func makeMove(move: Move) -> Void {
        print("Made move: \(move.rawValue)")
        let didWin = shouldWin ? didUser(beat: cpuChoice, with: move) : didUser(loseTo: cpuChoice, with: move)
        if didWin {
            moveAlertTitle = "Good job!"
            moveAlertMessage = "You successfully \(shouldWin ? "beat" : "lost to") the CPU!"
            score += 1
        } else {
            moveAlertTitle = "Oh no!"
            moveAlertMessage = "You did not \(shouldWin ? "beat" : "lose to") the CPU."
        }
        moveAlertIsPresented = true
    }
    
    func nextRound() -> Void {
        if (numRound < maxRounds) {
            numRound += 1
            cpuChoice = Move.allCases.randomElement()!
            shouldWin = Bool.random()
            bgColors.shuffle()
        } else {
            gameOverAlertIsPresented = true
        }
    }
    
    func didUser(beat move1: Move, with move2: Move) -> Bool {
        switch move1 {
        case .rock:
            return move2 == .paper
        case .paper:
            return move2 == .scissors
        case .scissors:
            return move2 == .rock
        }
    }
    
    func didUser(loseTo move1: Move, with move2: Move) -> Bool {
        switch move1 {
        case .rock:
            return move2 == .scissors
        case .paper:
            return move2 == .rock
        case .scissors:
            return move2 == .paper
        }
    }
}

#Preview {
    ContentView()
}
