//
//  HomeView2.swift
//  P8_Moonshot_2024
//
//  Created by  Ty Vaughan on 3/6/24.
//

import SwiftUI

struct HomeView2: View {
    
    @State private var path = NavigationPath()
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var displayAsGrid = true
    
    var body: some View {
        NavigationStack(path: $path) {
            Group {
                if displayAsGrid {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(missions) { mission in
                                NavigationLink(value: mission) {
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
                                NavigationLink(value: mission) {
                                    MissionCard(mission: mission)
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
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
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
    HomeView2()
}
