//
//  UsersView.swift
//  P12_SwiftDataTechnique_2024
//
//  Created by  Ty Vaughan on 3/16/24.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var path: NavigationPath
    
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    // This will get all users sorted by name
    // @Query(sort: \User.name) var users: [User]
    
    // This will get all users whose name contains "R", and sort them by name
    @Query(filter: #Predicate<User> { user in
        user.name.localizedStandardContains("R") &&
        user.city == "London"
    }, sort: \User.name) var users: [User]
    
    var body: some View {
        UserList(
            minimumJoinDate: showingUpcomingOnly ? .now : .distantPast,
            sortOrder: sortOrder
        )
        .navigationTitle("Users")
        .navigationDestination(for: User.self) { user in
            EditUserView(user: user)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(showingUpcomingOnly ? "Show everyone" : "Show upcoming") {
                    showingUpcomingOnly.toggle()
                }
            }
//            ToolbarItem(placement: .primaryAction) {
//                Button("Add user", systemImage: "plus", action: addUser)
//            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add samples", systemImage: "plus.diamond", action: addSamples)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate),
                            ])
                        Text("Sort by Join Date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
            }
        }
    }
    
    func addUser() -> Void {
        let user = User(name: "Name", city: "City", joinDate: .now)
        modelContext.insert(user)
        path.append(user) // This will auto-nagivate us to the edit user view
    }
    
    func addSamples() -> Void {
        try? modelContext.delete(model: User.self)
        
        let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
        let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
        let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
        let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

        modelContext.insert(first)
        modelContext.insert(second)
        modelContext.insert(third)
        modelContext.insert(fourth)
    }

}

#Preview {
    do {
        let path = NavigationPath()
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let userContainer = try ModelContainer(for: User.self, configurations: config)
        let jobContainer = try ModelContainer(for: Job.self, configurations: config)
        return NavigationStack(path: .constant(path)) {
            UsersView(path: .constant(path))
                .modelContainer(userContainer)
                .modelContainer(jobContainer)
        }
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
