//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Marshall  on 7/8/22.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                    
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map({$0.name}))
    }
}

struct HistoryView_Previews: PreviewProvider {
    
    static var history: History {
        History(
            attendees: [DailyScrum.Attendee(name: "Mark"),
                        DailyScrum.Attendee(name: "Bruna"),
                        DailyScrum.Attendee(name: "Winnebago")],
            lengthInMinutes: 5,
            transcript: "Once upon a time not long ago in the far distant galaxy of aznerak...no wait...sazarak? What's it called again? Anyway..."
        )
    }
    
    static var history2 = History(attendees: [DailyScrum.Attendee(name: "Mark"),
                                              DailyScrum.Attendee(name: "Bruna"),
                                              DailyScrum.Attendee(name: "Winnebago")],
                                  lengthInMinutes: 10,
                                  transcript: "Bleep bloop blorp")
    
    static var previews: some View {
        HistoryView(history: history2)
    }
}
