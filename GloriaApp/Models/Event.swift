//
//  Event.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 16/11/22.
//

import Foundation

struct Event {
    
    let eventName: String
    let eventType: String
    let eventLocation: String
    let eventDateTime: Date
}

extension Event {
    
    static func customDate() -> Date {
        
        var date = DateComponents()
        date.year = 2022
        date.month = Int.random(in: 1...12)
        date.day = Int.random(in: 1...31)
        date.hour = Int.random(in: 0...24)
        date.minute = 0
        
        let userCalendar = Calendar.current
        let dateAndTime = userCalendar.date(from: date)!
        
        return dateAndTime
    }
    
    static func dateFormatter(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    static func timeFormatter(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: date)
    }
    
    static var data: [Event] = {[
        Event(eventName: "Test 1", eventType: "Umum", eventLocation: "Test 1", eventDateTime: Event.customDate()),
        Event(eventName: "Test 2", eventType: "Umum", eventLocation: "Test 2", eventDateTime: Event.customDate()),
        Event(eventName: "Test 3", eventType: "Umum", eventLocation: "Test 3", eventDateTime: Event.customDate()),
        Event(eventName: "Test 4", eventType: "Umum", eventLocation: "Test 4", eventDateTime: Event.customDate()),
        Event(eventName: "Test 5", eventType: "Umum", eventLocation: "Test 5", eventDateTime: Event.customDate()),
    ]}()
}
