//
//  Events.swift
//  ITMO.EVENTS
//
//  Created by mi11ion on 14.12.2023.
//

import SwiftUI

struct EventView: View {
    let event: Event

    var body: some View {
        NavigationLink(value: event) {
            HStack {
                Image(event.eventImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 66, height: 66)
                    .clipped()
                    .cornerRadius(15)
                VStack(alignment: .leading) {
                    Text(event.eventTitle).font(.headline)
                    Text(event.eventDate).font(.footnote)
                    Text(event.eventDetails).font(.subheadline).frame(maxHeight: 60)
                }
                Spacer()
            }
            .padding(.vertical, 5)
        }
        .navigationDestination(for: Event.self) { selectedEvent in
            DetailedEventView(event: selectedEvent)
        }
    }
}

struct Event: Hashable {
    var eventTitle: String
    var eventDate: String
    var eventDetails: String
    var eventImage: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(eventTitle)
        hasher.combine(eventDate)
        hasher.combine(eventDetails)
        hasher.combine(eventImage)
    }

    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.eventTitle == rhs.eventTitle &&
            lhs.eventDate == rhs.eventDate &&
            lhs.eventDetails == rhs.eventDetails &&
            lhs.eventImage == rhs.eventImage
    }
}
