//
//  ContentView.swift
//  M4_FriendFace_2024
//
//  Created by  Ty Vaughan on 3/18/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query() var users: [User]
    
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            UsersView()
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async -> Void {
        // Check if users have already been loaded
        if users.count != 0 {
            print("Users have already been loaded")
            return
        }

        // Load users
        _ = await UsersService().loadUsers(modelContext: modelContext)
        
        // Save the users in a single transaction
//        try? modelContext.transaction {
//            for user in loadedUsers {
//                modelContext.insert(user)
//            }
//            do {
//                try modelContext.save()
//            } catch {
//                print("Failed to save users")
//            }
//        }
    }

}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(
            for: User.self, Friend.self,
            configurations: config
        )
        container.mainContext.autosaveEnabled = false
        return ContentView()
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
