//
//  AddHabitView.swift
//  M3_HabitTracker_2024
//
//  Created by  Ty Vaughan on 3/7/24.
//

import SwiftUI

struct AddActivityView: View {
    let activityStore: ActivityStore

    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    
    var isValid: Bool {
        !name.isEmpty && !description.isEmpty
    }
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Name", text: $name)
            }
            
            Section("Description") {
                TextEditor(text: $description)
                    .foregroundColor(.primary)
            }
        }
        .navigationTitle(name.isEmpty ? "New Activity" : name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    addActivity()
                    dismiss()
                } label: {
                    Text("Save")
                }
                .disabled(!isValid)
            }
        }
    }
    
    func addActivity() {
        let activity = Activity(name: name, description: description, count: 0)
        activityStore.activities.append(activity)        
    }
}

#Preview {
    NavigationStack {
        AddActivityView(activityStore: ActivityStore())
    }
}
