//
//  QuestionCountSelection.swift
//  M2_Edutainment_2024
//
//  Created by  Ty Vaughan on 3/2/24.
//

import SwiftUI

struct QuestionCountSelection: View {
        
    @Binding public var numQuestions: Int
    
    @State private var options = [5, 10, 20]
    
    var body: some View {
        VStack {
            Text("How many questions?")
            HStack {
                ForEach(options, id: \.self) { option in
                    Button {
                        updateNumQuestions(option)
                    } label: {
                        Text("\(option)")
                            .font(.system(size: 32))
                            .frame(width: 80, height: 50)
                            .background(numQuestions == option ? .blue : .cyan)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            .opacity(numQuestions == option ? 1.0 : 0.5)
                            .shadow(
                                color: .gray,
                                radius: numQuestions == option ? 4 : 0
                            )
                    }
                }
            }
        }
    }
    
    func updateNumQuestions(_ value: Int) {
        numQuestions = value
    }
}

// MARK: - Dynamic Preview

struct QuestionCountSelectionPreviewContainer: View {
    @State var numQuestionsBindingValue: Int = 10

    var body: some View {
        QuestionCountSelection(numQuestions: $numQuestionsBindingValue)
    }
}

struct QuestionCountSelectionPreview: PreviewProvider {
    static var previews: some View {
        QuestionCountSelectionPreviewContainer()
    }
}

//#Preview {
//    QuestionCountSelection()
//}
