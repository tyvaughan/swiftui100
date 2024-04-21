//
//  ContentView.swift
//  P19_SnowSeeker_2024
//
//  Created by  Ty Vaughan on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var favorites = Favorites()
    @State private var searchText = ""
    
    
    @State private var sortMethod = "default"
    let sortOptions: [String] = ["default", "name", "country"]
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    var sortedResorts: [Resort] {
        switch sortMethod {
        case "name":
            return resorts.sorted { a, b in
                a.name < b.name
            }
        case "country":
            return resorts.sorted { a, b in
                a.country < b.country
            }
        default:
            return resorts
        }
    }
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            sortedResorts
        } else {
            sortedResorts.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                .rect(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortMethod) {
                            Text("Sort by default")
                                .tag("default")
                            Text("Sort by name")
                                .tag("name")
                            Text("Sort by country")
                                .tag("country")
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
        } detail: {
            WelcomeView()
        }
        .environment(favorites)
    }
}

#Preview {
    ContentView()
}
