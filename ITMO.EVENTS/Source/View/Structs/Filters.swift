//
//  Filters.swift
//  ITMO.EVENTS
//
//  Created by mi11ion on 12.12.2023.
//

import SwiftUI

struct Filters: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                FilterButton(filter: "Проверено", options: [])
                FilterButton(filter: "Тип", options: ["Для всех", "Для студентов ИТМО", "Для сотрудников ИТМО"])
                FilterButton(filter: "Место", options: ["Ломоносова 9", "Кронверкский Пр. 49", "Биржевая 14", "Пер. Гривцова 14", "Ягодное", "Другое"])
                FilterButton(filter: "Аудитория", options: ["4130/2", "Orange Classroom"])
                FilterButton(filter: "Формат", options: ["Офлайн", "Онлайн"])
                FilterButton(filter: "Организаторы", options: ["Администрация", "ITMO.Megabattle", "Клуб", "Студенты"])
                FilterButton(filter: "Число участников", options: ["от 0 до 9 участников", "от 10 до 49 участников", "от 51 до 99 участников", "от 100 участников"])
                FilterButton(filter: "Требуются волонтеры", options: [])
                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}

struct FilterButton: View {
    var filter: String
    var options: [String]
    
    @State private var isMenuOpen: Bool = false
    @State private var selectedOptions: Set<String> = []

    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    toggleOption(option)
                }) {
                    HStack {
                        Text(option)
                        Spacer()
                        if selectedOptions.contains(option) {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        } label: {
            Text(filter)
                .font(.headline)
                .foregroundColor(selectedOptions.isEmpty ? Color.colorado : Color.unColorado)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(selectedOptions.isEmpty ? Color.gray.opacity(0.2) : Color.colorado)
                .cornerRadius(10)
        }
        .onTapGesture {
            if options.isEmpty {
                toggleOption(filter)
            }
        }
    }

    private func toggleOption(_ option: String) {
        if selectedOptions.contains(option) {
            selectedOptions.remove(option)
        } else {
            selectedOptions.insert(option)
        }

        if selectedOptions.isEmpty {
            isMenuOpen = false
        } else {
            isMenuOpen = true
        }
    }
}
