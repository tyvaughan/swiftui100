//
//  ObservableObjectsInEnvironment.swift
//  P19_SnowSeeker_2024
//
//  Created by  Ty Vaughan on 4/18/24.
//

import SwiftUI

struct ObservableObjectsInEnvironment: View {
    @State private var player = Player()
    
    var body: some View {
        VStack {
            Text("Welcome! Player has score: \(player.highScore)")
            HighScoreView()
        }
        .environment(player) // class must use @Observable macro to be injected into the Environment
    }
    
    // Classes
    
    @Observable
    class Player {
        var name = "Anonymous"
        var highScore = 0
    }
    
    // Sub Views
    
    struct HighScoreView: View {
        /*
         If a value is not available in the environment when referenced, the app will crash
         */
        @Environment(Player.self) var player
        
        var body: some View {
            /*
             Currently, if we wish to change the value of an environment value, Apple suggests that we declare a new @Bindable property wrapper and assign the environment value.
             */
            @Bindable var player = player

            Stepper("Your high score: \(player.highScore)", value: $player.highScore)
        }
    }
}

#Preview {
    ObservableObjectsInEnvironment()
}
