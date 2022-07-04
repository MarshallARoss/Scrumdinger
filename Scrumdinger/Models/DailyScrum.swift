//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Marshall  on 7/4/22.
//

import Foundation

struct DailyScrum {
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var theme: Theme
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .bubblegum),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .magenta),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .periwinkle)
    ]
}
