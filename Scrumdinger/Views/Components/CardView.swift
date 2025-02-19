//
//  CardView.swift
//  Scrumdinger
//
//  Created by Edwin Mbaabu on 2/2/25.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack{
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .labelStyle(.trailingIcon)
                    .accessibilityLabel("\(scrum.lengthInMinutes) minutes meeting")
                
            }
            .font(.caption)
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
    }
}

#Preview {
    let scrum = DailyScrum.sampleData[0]
        
    CardView(scrum: scrum)
        .background(scrum.theme.mainColor)
        
}
