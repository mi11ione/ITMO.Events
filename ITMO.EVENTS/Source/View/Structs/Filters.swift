//
//  Filters.swift
//  ITMO.EVENTS
//
//  Created by mi11ion on 12.12.2023.
//

import SwiftUI

struct Filters: View {
    let filterKeys = [
        "Проверено",
        "Для студентов",
        "Для всех",
        "Ломо",
        "Кронва",
        "Онлайн",
        "Офлайн",
    ]

    var filters: [String] {
        filterKeys.map { NSLocalizedString($0, comment: "") }
    }

    @Binding var selectedFilter: String

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filters, id: \.self) { filter in
                    FilterButton(filter: filter, isSelected: .constant(filter == selectedFilter), onSelectionChange: { isSelected in
                        selectedFilter = isSelected ? filter : ""
                    })
                }
                Spacer()
            }
            .padding(.horizontal, 22)
        }
    }
}

struct FilterButton: View {
    @Environment(\.colorScheme) var colorScheme

    var filter: String
    @Binding var isSelected: Bool

    var onSelectionChange: ((Bool) -> Void)?

    var body: some View {
        Button(action: {
            withAnimation(.smooth) {
                let newState = !isSelected
                isSelected = newState
                onSelectionChange?(newState)
            }
        }) {
            Text(filter)
                .font(.headline)
                .foregroundColor(isSelected ? (colorScheme == .dark ? .black : .white) : (colorScheme == .dark ? .white : .black))
                .padding(.horizontal, 15)
                .padding(.vertical, 7)
                .background(backgroundView)
                .cornerRadius(10)
        }
    }

    private var backgroundView: some View {
        Group {
            if isSelected == false {
                Rectangle().fill(Material.ultraThin)
            } else {
                Rectangle().fill(colorScheme == .dark ? Color.white : Color.black)
            }
        }
    }
}
