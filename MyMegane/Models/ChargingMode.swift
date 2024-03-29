//
//  ChargingMode.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 28.03.24.
//

import Foundation

enum ChargingMode: String, CaseIterable {
    case immediate = "Sofort Laden"
    case delayed = "Verzögert"
    case planning = "Ladeplanung"
    
    var icon: String {
        switch self {
        case .immediate:
            return "bolt.batteryblock"
        case .delayed:
            return "clock"
        case .planning:
            return "bolt.badge.clock.fill"
        }
    }
    
    var description: String {
        switch self {
        case .immediate:
            return "Schließen Sie das Ladekabel an Ihr Fahrzeug an, um mit dem sofortigen Ladevorgang zu beginnen."
        case .delayed:
            return "Beginnen Sie mit dem Aufladen Ihres Elektrofahrzeugs, wann immer Sie möchten."
        case .planning:
            return "Stellen Sie die wöchentliche Ladeplanung Ihres Fahrzeugs ein."
        }
    }
}
