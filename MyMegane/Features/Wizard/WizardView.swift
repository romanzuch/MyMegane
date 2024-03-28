//
//  WizardView.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 23.03.24.
//

import SwiftUI

struct WizardView: View {
    
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    @StateObject private var wizardViewModel: WizardViewModel = WizardViewModel()
    
    var body: some View {
        ZStack {
            BackgroundGradient()
            ScrollViewReader { value in
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(Array(wizardViewModel.onboardingViews.enumerated()), id: \.1.self) { index, view in
                            view.screen
                                .environmentObject(wizardViewModel)
                                .environmentObject(settingsViewModel)
                                .containerRelativeFrame(.horizontal, count: 1, spacing: 16.0)
                                .id(index)
                        }
                    }
                    .scrollTargetLayout()
                    .padding(.bottom, 8)
                    HStack {
                        ForEach(0..<wizardViewModel.onboardingViews.count, id: \.self) { step in
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: wizardViewModel.currentWizardStep == step ? 16 : 8, height: 8, alignment: .center)
                                .foregroundStyle(.ultraThinMaterial)
                                .id(step)
                        }
                    }
                }
                .ignoresSafeArea()
                .padding(.top, 4)
                .padding(.bottom)
                .scrollTargetBehavior(.viewAligned)
                .scrollDisabled(true)
                .scrollIndicators(.hidden)
                .onChange(of: wizardViewModel.currentWizardStep) {
                    value.scrollTo(wizardViewModel.currentWizardStep)
                }
            }
        }
    }
    
}

#Preview {
    WizardView()
        .environmentObject(SettingsViewModel())
}
