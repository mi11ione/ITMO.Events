//
//  EventButton.swift
//  ITMO.EVENTS
//
//  Created by mi11ion on 12.12.2023.
//

import SwiftUI

struct AddEventButton: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showSheet = false

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    showSheet = true
                }) {
                    Image(systemName: "calendar.badge.plus")
                        .font(.title)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 66, height: 66)
                        .foregroundColor(.black)
                        .background(buttonBackgroundColor)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        .padding()
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            EventCreationSheet()
        }
    }

    private var buttonBackgroundColor: Color {
        return colorScheme == .dark ? Color.addButton : .white
    }
}
