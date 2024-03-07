//
//  HabitDetailsView.swift
//  M3_HabitTracker_2024
//
//  Created by  Ty Vaughan on 3/7/24.
//

import SwiftUI

struct HabitDetailsView: View {
    @State var activity: Activity
    @State var activityStore: ActivityStore

    var body: some View {
        VStack {
            VStack {
                Text("\(activity.description)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            VStack(spacing: 10) {
                Text("\(activity.count)")
                    .font(.system(size: 100))
                Button {
                    incrementHabit()
                } label: {
                    ZStack {
                        Capsule()
                            .foregroundColor(.red)
                            .frame(width: 200, height: 60)
                        Text("Track activity")
                    }
                }
                .buttonStyle(.plain)
            }
            Spacer()
        }
        .navigationTitle("\(activity.name)")
    }
    
    func incrementHabit() {
        activity.count += 1
        if let index = activityStore.activities.firstIndex(where: { a in
            a.id == activity.id
        }) {
            activityStore.activities.replaceSubrange(index...index, with: [activity])
        }
    }
}

// MARK: - Dynamic Preview

//struct HabitDetailsViewPreviewContainer: View {
//    @State var activity = Activity(
//        name: "Piano",
//        description: """
//                     This is a detailed description.
//                     There's so much to do.
//                     There's so much to see.
//                     """,
//        count: 0
//    )
//    
//    var body: some View {
//        HabitDetailsView(activity: $activity)
//    }
//}
//
//struct HabitDetailsViewPreview: PreviewProvider {
//    static var previews: some View {
//        HabitDetailsViewPreviewContainer()
//    }
//}

#Preview {
    let activity = Activity(
        name: "Piano",
        description: """
                     This is a detailed description.
                     There's so much to do.
                     There's so much to see.
                     """,
        count: 0
    )
    let activityStore = ActivityStore()

    return NavigationStack {
        HabitDetailsView(activity: activity, activityStore: activityStore)
    }
}
