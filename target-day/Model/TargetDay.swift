//
//  TargetDay.swift
//  target-day
//
//  Created by Alex Balabanov on 17.06.22.
//

import Foundation

struct TargetDay: Identifiable, Hashable {
    var id = UUID()
    var eventName: String
    let date: Date
}

extension TargetDay: Codable {}
