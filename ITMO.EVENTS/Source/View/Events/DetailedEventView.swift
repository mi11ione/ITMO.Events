//
//  DetailedEventView.swift
//  ITMO.EVENTS
//
//  Created by mi11ion on 19.12.2023.
//

import SwiftUI

struct DetailedEventView: View {
    let event: Event

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Image("")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                    .clipped()
                    .cornerRadius(10)

                Text(event.eventTitle)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)

                Text("Состоится")
                    .font(.headline)
                    .padding(.bottom, 3)

                Text(event.eventDate)
                    .font(.headline)
                    .bold()
                    .padding(.bottom, 3)

                Text("Подробности")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.vertical, 5)

                Text(event.eventDetails)
                    .font(.body)
            }
            .padding()
        }
        .navigationBarTitle("Описание мероприятия", displayMode: .inline)
    }
}
