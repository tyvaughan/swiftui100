//
//  ActivityCard.swift
//  M3_HabitTracker_2024
//
//  Created by  Ty Vaughan on 3/7/24.
//

import SwiftUI

struct ActivityCard: View {
    let activity: Activity

    var body: some View {
        HStack {
            Text("\(activity.name)")
                .font(.system(size: 18))
                .fontWeight(.semibold)
            Spacer()
            Text("\(activity.count)")
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

#Preview {
    let activity = Activity(name: "🎹 Piano", description: "Practice playing the piano.", count: 5)

    return ActivityCard(activity: activity)
}
