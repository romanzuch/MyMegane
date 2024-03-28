//
//  WizardViewModel.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 23.03.24.
//

import Foundation

class WizardViewModel: ObservableObject {
    @Published var currentWizardStep: Int = 0
    let onboardingViews: [OnboardingView] = OnboardingView.allCases
}
