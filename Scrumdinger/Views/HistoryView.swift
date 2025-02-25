//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Edwin Mbaabu on 2/25/25.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
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
        ListFormatter.localizedString(byJoining: attendees.map{ $0.name})
    }
}


#Preview {
    var history: History {
        History(attendees: [
            DailyScrum.Attendees(name: "Jon"),
            DailyScrum.Attendees(name: "Darla"),
            DailyScrum.Attendees(name: "Luis")
        ],
                transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI...")
    }


    HistoryView(history: history)
}
