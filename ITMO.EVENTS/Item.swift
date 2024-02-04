//
//  Item.swift
//  ITMO.EVENTS
//
//  Created by mi11ion on 24.11.2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
