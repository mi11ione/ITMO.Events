//
//  ProfileView.swift
//  ITMO.EVENTS
//
//  Created by mi11ion on 13.12.2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.horizontal)
                
            VStack(alignment: .leading) {
                Text("Имя Фамилия")
                    .font(.title)
                Text("Должность")
            }
            Spacer()
        }
    }
}

struct ProfileView: View {
    var body: some View {
        VStack {
            ProfileHeaderView()
            Text("История посещенных мероприятий")
                .font(.subheadline)
                .padding(.vertical, 7)
            EventsView()
        }
        .navigationBarTitle("Профиль и Настройки", displayMode: .inline)
        .padding(.top, 16)
    }
}
