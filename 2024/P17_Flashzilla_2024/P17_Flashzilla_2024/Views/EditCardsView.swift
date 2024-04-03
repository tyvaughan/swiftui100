//
//  EditCardsView.swift
//  P17_Flashzilla_2024
//
//  Created by  Ty Vaughan on 4/2/24.
//

import SwiftUI

struct EditCardsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    
    var isValid: Bool {
        !newPrompt.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !newAnswer.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add card", action: addCard)
                        .disabled(!isValid)
                }
                
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .onAppear(perform: loadData)
        }
    }
    
    // MARK: Card methods
    
    func addCard() -> Void {
        guard isValid else { return }
        cards.append(Card(
            prompt: newPrompt.trimmingCharacters(in: .whitespacesAndNewlines),
            answer: newAnswer.trimmingCharacters(in: .whitespacesAndNewlines)
        ))
        newPrompt = ""
        newAnswer = ""
        saveData()
    }
    
    func removeCards(at offsets: IndexSet) -> Void {
        cards.remove(atOffsets: offsets)
        saveData()
    }
    
    // MARK: UserDefaults methods
    
    func loadData() -> Void {
        cards = CardService.load()
//        if let data = UserDefaults.standard.data(forKey: "Cards") {
//            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
//                cards = decoded
//            }
//        }
    }
    
    func saveData() -> Void {
        CardService.save(cards: cards)
//        if let data = try? JSONEncoder().encode(cards) {
//            UserDefaults.standard.set(data, forKey: "Cards")
//        }
    }
    
    // MARK: Helper methods
    
    func done() -> Void {
        dismiss()
    }
}

#Preview {
    EditCardsView()
}
