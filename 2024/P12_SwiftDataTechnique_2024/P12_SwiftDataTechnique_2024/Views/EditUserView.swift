//
//  EditUserView.swift
//  P12_SwiftDataTechnique_2024
//
//  Created by  Ty Vaughan on 3/16/24.
//

import SwiftData
import SwiftUI

struct EditUserView: View {
    @Environment(\.modelContext) var modelContext

    @Bindable var user: User

    var body: some View {
        Form {
            Section("Info") {
                TextField("Name", text: $user.name)
                TextField("City", text: $user.city)
                DatePicker("Join date", selection: $user.joinDate)
            }
            Section("Jobs") {
                if user.unwrappedJobs.count == 0 {
                    Text("No jobs yet")
                } else if user.unwrappedJobs.count > 0 {
                    List(user.unwrappedJobs) { job in
                        HStack {
                            Text(job.name)
                            Spacer()
                            Text(String(job.priority))
                        }
                    }
                }
            }
            Section {
                Button("Add job", action: addJob)
            }
        }
        .navigationTitle("Edit user")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addJob() {
        let job1 = Job(name: "Organize sock drawer", priority: Int.random(in: 1...10), owner: user)
        let job2 = Job(name: "Make plans with Alex", priority: Int.random(in: 1...10), owner: user)
        user.jobs?.append(job1)
        user.jobs?.append(job2)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let userContainer = try ModelContainer(for: User.self, configurations: config)
        let jobContainer = try ModelContainer(for: Job.self, configurations: config)
        let user = User(name: "Taylor Swift", city: "Nashville", joinDate: .now)
        return EditUserView(user: user)
            .modelContainer(userContainer)
            .modelContainer(jobContainer)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
