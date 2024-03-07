//
//  SavingNavigationPath.swift
//  P9_Navigation_2024
//
//  Created by  Ty Vaughan on 3/6/24.
//

import SwiftUI

@Observable
class ArrayPathStore {
    var path: [Int] {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                path = decoded
                return
            }
        }
        path = []
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(path)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

@Observable
class NavigationPathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        path = NavigationPath()
    }
    
    func save() {
        do {
            guard let representation = path.codable else { return }
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct SavingNavigationPath: View {
    @State private var pathStore = NavigationPathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0, path: $pathStore.path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $pathStore.path)
                }
        }
    }
    
    struct DetailView: View {
        var number: Int
        
        @Binding public var path: NavigationPath
        
        var body: some View {
            NavigationLink("Go to random number", value: Int.random(in: 1...1000))
                .navigationTitle("Number: \(number)")
                .toolbar {
                    Button("Home") {
                        path = NavigationPath()
                    }
                }
        }
    }
        
}

#Preview {
    SavingNavigationPath()
}
