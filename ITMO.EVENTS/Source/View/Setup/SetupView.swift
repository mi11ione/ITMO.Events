//
//  SetupView.swift
//  ITMO.EVENTS
//
//  Created by mi11ion on 24.11.2023.
//

import SwiftUI

struct SetupView: View {
    @State private var isSafariViewPresented = false

    var onLoginComplete: () -> Void

    var body: some View {
        VStack {
            Spacer()
            Text("ITMO.EVENTS")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()

            Button(action: {
                isSafariViewPresented.toggle()
            }) {
                HStack(spacing: 4) {
                    Text("Continue via")
                        .font(.headline)
                        .bold()
                    Image("itmo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 78, height: 24)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color.weird)
                .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .sheet(isPresented: $isSafariViewPresented) {
            SafariView(url: URL(string: "https://my.itmo.ru/login")!, onLoginComplete: onLoginComplete)
        }
    }
}
