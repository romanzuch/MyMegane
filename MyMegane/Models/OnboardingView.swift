//
//  OnboardingView.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 25.03.24.
//

import Foundation
import SwiftUI

enum OnboardingView: CaseIterable {
    case welcome
    
    var screen: some View {
        switch self {
        case .welcome:
            return WizardGreetingView()
        }
    }
}
