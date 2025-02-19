//
//  History.swift
//  Scrumdinger
//
//  Created by Edwin Mbaabu on 2/7/25.
//

import Foundation

struct History : Identifiable, Codable{
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendees]
    
    init(id: UUID = UUID() , date: Date = Date(), attendees: [DailyScrum.Attendees]) {
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}
