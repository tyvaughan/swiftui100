//
//  HomeView.swift
//  P8_Moonshot_2024
//
//  Created by  Ty Vaughan on 3/6/24.
//

import SwiftUI

struct HomeView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var displayAsGrid = true
    
    var body: some View {
        NavigationStack {
            Group {
                if displayAsGrid {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(missions) { mission in
                                NavigationLink {
                                    MissionView(mission: mission, astronauts: astronauts)
                                } label: {
                                    MissionCard(mission: mission)
                                }
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                } else {
                    List(missions) { mission in
                        MissionCard(mission: mission)
                            .overlay(
                                NavigationLink("") {
                                    MissionView(mission: mission, astronauts: astronauts)
                                }
                                    .opacity(0)
                            )
                            .listRowBackground(Color.darkBackground)
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            .background(.darkBackground)
            .toolbar {
                Button(displayAsGrid ? "List view" : "Grid view") {
                    displayAsGrid.toggle()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
