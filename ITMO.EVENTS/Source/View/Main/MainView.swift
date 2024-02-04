//
//  MainView.swift
//  ITMO.EVENTS
//
//  Created by mi11ion on 12.12.2023.
//

import SwiftUI

struct MainView: View {
    @State private var navigationPath = NavigationPath()

    enum Tab: Hashable {
        case events, profile
    }

    var body: some View {
        NavigationStack(path: $navigationPath) {
            mainContent
            .navigationDestination(for: String.self) { value in
                Text(value)
            }
            .navigationDestination(for: Tab.self) { tab in
                destinationView(for: tab)
            }
        }
    }

    private var mainContent: some View {
        ZStack {
            VStack {
                Filters()
                EventsView()
            }
            .navigationBarTitle("ITMO.EVENTS", displayMode: .inline)
            .padding(.top, 5)
            .navigationBarItems(trailing: profileButton)
            AddEventButton()
        }
    }

    private func destinationView(for tab: Tab) -> some View {
        switch tab {
        case .profile:
            return AnyView(ProfileView())
        default:
            return AnyView(EmptyView())
        }
    }

    private var profileButton: some View {
        Button(action: {
            navigationPath.append(Tab.profile)
        }) {
            Image(systemName: "person.crop.circle")
                .font(.title)
                .imageScale(.medium)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    MainView()
}
