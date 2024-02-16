//
//  DateComponentsView.swift
//  P4_BetterRest_2024
//
//  Created by  Ty Vaughan on 2/23/24.
//

import SwiftUI

struct DateComponentsView: View {
    var body: some View {
        Text(Date.now, format: .dateTime.hour().minute())
        Text(Date.now, format: .dateTime.day().month().year())
        Text(Date.now.formatted(date: .long, time: .shortened))
    }
    
    /*
     We can use DateComponents to create a new Date using only the time component values that are important to us
     */
    func getDate() -> Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? .now
        return date
    }
    
    /*
     We can use DateComponents to pull out the time component values from a Date
     */
    func getHourAndMinute(from date: Date) -> (Int, Int) {
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        return (hour, minute)
    }
}

#Preview {
    DateComponentsView()
}
