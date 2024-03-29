//
//  ChargingPlan.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 29.03.24.
//

import Foundation

struct ChargingPlan {
    let id: UUID = UUID()
    var days: [String] = [String]()
    var timeslot: DateInterval = .init(start: Date.now, duration: 1.0)
}
