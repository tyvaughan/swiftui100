//
//  DateComponents.swift
//  P4_BetterRest
//
//  Created by  Ty Vaughan on 6/8/23.
//

import Foundation
import SwiftUI

/*
 A Date in Swift can be created using DateComponents, where each element of time is individually treated
 */

func createDate() -> Date {
    var components = DateComponents()
    components.hour = 8
    components.minute = 0
    let date = Calendar.current.date(from: components) ?? Date.now
    return date
}

func getHoursAndMinutes(from date: Date) -> (hour: Int, minute: Int) {
    let components = Calendar.current.dateComponents([.hour, .minute], from: date)
    let hour = components.hour ?? 0
    let minute = components.minute ?? 0
    return ( hour: hour, minute: minute )
}

func formatDate(date: Date) -> Void {
    // We can use a Text view's automatic format option to format a Date value
    let sampleTextView1 = Text(Date.now, format: .dateTime.hour().minute())
    let sampleTextView2 = Text(Date.now, format: .dateTime.day().month().year()) // the order we request does not matter
    
    // We can also use the .formatted method of a Date
    let formattedDate1 = Date.now.formatted(date: .long, time: .shortened)
}
