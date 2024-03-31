//
//  EventCreation.swift
//  ITMO.EVENTS
//
//  Created by mi11ion on 19.12.2023.
//

import SwiftUI

struct EventCreationSheet: View {
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var nameText: String = ""
    @State private var descriptionText: String = ""
    @State private var selectedFilter: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Шапка мероприятия")
                        .padding([.top, .leading, .trailing])
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100)
                            .clipped()
                            .cornerRadius(10)
                            .padding()
                            .onTapGesture {
                                isImagePickerPresented = true
                            }
                    } else {
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color.wow)
                                .frame(height: 100)
                                .cornerRadius(10)
                                .onTapGesture {
                                    isImagePickerPresented = true
                                }
                            HStack {
                                Image(systemName: "photo.badge.arrow.down")
                                    .frame(height: 20)
                                Text("Загрузить изображение")
                            }
                        }
                        .padding()
                    }

                    Text("Название мероприятия")
                        .padding([.top, .leading, .trailing])
                    TextField("Пример: ITMO.MegaBattle", text: $nameText, axis: .vertical)
                        .padding(.vertical, 7)
                        .padding(.horizontal, 12)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 9))
                        .padding([.leading, .trailing])

                    Text("Описание мероприятия")
                        .padding([.top, .leading, .trailing])
                    TextField("Пример: Очень интересное мероприятие", text: $descriptionText, axis: .vertical)
                        .padding(.vertical, 7)
                        .padding(.horizontal, 10)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 9))
                        .padding([.leading, .trailing])

                    Filters(selectedFilter: $selectedFilter).padding(.vertical, 10)
                }
            }
            .navigationBarItems(leading: Button("Назад") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Готово") {
                presentationMode.wrappedValue.dismiss()
            })
            .scrollDismissesKeyboard(.interactively)
            .navigationBarTitle("Создать мероприятие", displayMode: .inline)
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(selectedImage: $selectedImage)
            }
        }
    }
}
