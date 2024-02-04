//
//  ContentView.swift
//  ITMO.EVENTS
//
//  Created by mi11ion on 24.11.2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("setupCompleted") private var setupCompleted = false
    @State private var showMainView = false

    var body: some View {
        if setupCompleted {
            MainView()
                .transition(.opacity)
        } else {
            SetupView {
                setupCompleted = true
                withAnimation {
                    showMainView = true
                }
            }
            .onDisappear {
                if setupCompleted {
                    withAnimation {
                        showMainView = true
                    }
                }
            }
            .fullScreenCover(isPresented: $showMainView) {
                MainView()
            }
        }
    }
}

#Preview {
    ContentView()
}
