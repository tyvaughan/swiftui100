//
//  ContentView.swift
//  M4_FriendFace_2024
//
//  Created by  Ty Vaughan on 3/18/24.
//

import SwiftUI

struct ContentView: View {
    @State var users = [User]()
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            UsersView(users: $users)
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async -> Void {
        users = await UsersService().loadUsers()
    }

}

#Preview {
    ContentView()
}
