//
//  EventListView.swift
//  ITMO.EVENTS
//
//  Created by mi11ion on 14.12.2023.
//

import SwiftUI

struct EventListView: View {
    let events: [Event]

    var body: some View {
        List {
            ForEach(events, id: \.eventTitle) { EventView(event: $0) }
        }
    }
}

struct EventsView: View {
    let events = [
        Event(eventTitle: "",
              eventDate: "",
              eventDetails: "",
             eventImage: ""),
        Event(eventTitle: "",
              eventDate: "",
              eventDetails: "",
             eventImage: "")]

    var body: some View {
        NavigationView {
            EventListView(events: events)
        }
    }
}
