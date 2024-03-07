//
//  HomeView.swift
//  M3_HabitTracker_2024
//
//  Created by  Ty Vaughan on 3/7/24.
//

import SwiftUI

struct HomeView: View {
    @State private var activityStore = ActivityStore()
    @State public var path: NavigationPath
    
    var body: some View {
        List {
            if activityStore.activities.count == 0 {
                Text("Add your first habit!")
            }
            ForEach(activityStore.activities) { activity in
                ActivityCard(activity: activity)
                    .overlay(
                        NavigationLink(value: activity) {
                            
                        }
                            .opacity(0)
                    )
                    .listRowSeparator(.hidden)
            }
            .onDelete { indexSet in
                deleteActivity(at: indexSet)
            }
        }
        .listStyle(.plain)
        .navigationTitle("HabitTracker")
        .navigationDestination(for: Activity.self) { activity in
            HabitDetailsView(activity: activity, activityStore: activityStore)
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                NavigationLink {
                    AddActivityView(activityStore: activityStore)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func deleteActivity(at indexSet: IndexSet) {
        activityStore.activities.remove(atOffsets: indexSet)
    }
}

#Preview {
    NavigationStack {
        HomeView(path: NavigationPath())
    }
}
