//
//  ContentView.swift
//  P5_WordScramble
//
//  Created by  Ty Vaughan on 6/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var newWord = ""
    @State private var rootWord = ""
    @State private var usedWords = [String]()
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var score: Int {
        var score = 0
        for word in usedWords {
            score += word.count
        }
        return score
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section("Previous answers") {
                    if (usedWords.count == 0) {
                        Text("No answers yet")
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(usedWords, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                        }
                    }
                }
                                
                Section {
                    Text("Score: \(score)")
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                }
            }
            .navigationTitle(rootWord)
            .toolbar {
                Button("Restart") {
                    startGame()
                }
            }
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func startGame() {
        // Reset the game state
        withAnimation {
            usedWords = []
        }
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: ".txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        // If we could not load the file, trigger the app to terminate
        fatalError("Could not load start.txt from bundle.")
    }
    
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with different cases
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // ensure there are no inner spaces
        guard !answer.contains(/\s/) else {
            return
        }
        
        // exit if the remaining string is shorter than three characters
        guard answer.count > 2 else {
            return
        }
        
        // exit if the word is equal to the start word
        guard answer != rootWord else {
            wordError(title: "Looks familiar 🧐", message: "You can't use the root word.")
            return
        }
        
        // Perform validation checks on the answer
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        // insert the new word into the array
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
