//
//  MainMenuView.swift
//  M2_Edutainment_2024
//
//  Created by  Ty Vaughan on 3/2/24.
//

import SwiftUI

struct MainMenuView: View {
    
    @State private var table: Int = 5
    @State private var numQuestions: Int = 10

    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                Spacer()
                
                VStack(spacing: 64) {
                    TableSelection(table: $table)
                    
                    QuestionCountSelection(numQuestions: $numQuestions)
                    
                    NavigationLink {
                        GameView(questions: generateQuestions())
                    } label: {
                        Text("Play!")
                            .frame(width: 100, height: 60)
                            .background(.blue)
                            .foregroundColor(.white)
                            .font(.title2)
                            .cornerRadius(16)
                    }
                }
                
                Spacer()
                Spacer()
                Spacer()

            }
        }
    }
    
    // MARK: Helper methods
    
    func generateQuestions() -> [Question] {
        var questions = [Question]()
        for _ in 0 ..< numQuestions {
            let n2 = Int.random(in: 1...12)
            questions.append(Question(n1: table, n2: n2, a: table * n2))
        }
        return questions
    }

}

// MARK: - Preview

#Preview {
    MainMenuView()
}
