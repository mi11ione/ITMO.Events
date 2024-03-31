//
//  EventListView.swift
//  ITMO.EVENTS
//
//  Created by mi11ion on 14.12.2023.
//

import SwiftUI

struct EventsView: View {
    let events = [
        Event(eventTitle: "",
              eventDate: "",
              eventDetails: "",
              eventImage: ""),
        Event(eventTitle: "",
              eventDate: "",
              eventDetails: "",
              eventImage: ""),
        Event(eventTitle: "",
              eventDate: "",
              eventDetails: "",
              eventImage: ""),
        Event(eventTitle: "",
              eventDate: "",
              eventDetails: "",
              eventImage: ""),
    ]

    var body: some View {
        ForEach(events, id: \.eventTitle) {
            EventView(event: $0)
        }
    }
}
