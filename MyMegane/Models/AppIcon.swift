//
//  AppIcon.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 25.03.24.
//

import Foundation

enum AppIcon: CaseIterable {
    case standardIcon
    case greenIcon
    case colorfulIcon
    case megatronIcon
    
    var name: String {
        switch self {
        case .standardIcon:
            return "Standard"
        case .greenIcon:
            return "Green"
        case .colorfulIcon:
            return "Colorful"
        case .megatronIcon:
            return "Megatron"
        }
    }
}
