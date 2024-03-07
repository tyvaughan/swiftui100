//
//  Activity.swift
//  M3_HabitTracker_2024
//
//  Created by  Ty Vaughan on 3/7/24.
//

import Foundation

struct Activity: Identifiable, Codable, Hashable {
    var id = UUID()
    let name: String
    let description: String
    var count: Int
}

@Observable
class ActivityStore: Codable {
    var activities: [Activity] {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: K.userDefaultsKeys.activities)
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: K.userDefaultsKeys.activities) {
            if let decodedActivities = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                activities = decodedActivities
                return
            }
        }
            
        activities = [Activity]()
    }
    
    func getActivity(for id: UUID) -> Activity {
        guard let activity = activities.first(where: { a in
            a.id == id
        }) else {
            return Activity(name: "", description: "", count: 0)
        }
        return activity
    }
}
