//
//  ContentView.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 23.03.24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var settingsViewModel: SettingsViewModel = SettingsViewModel()
    
    var body: some View {
        switch settingsViewModel.showOnboardingWizard {
        case true:
            onboardingBody
        case false:
            defaultAppBody
        }
    }
    
    var defaultAppBody: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Dein Megane", systemImage: "car")
                }
                .environmentObject(settingsViewModel)
            SettingsView()
                .tabItem {
                    Label("Einstellungen", systemImage: "gear")
                }
                .environmentObject(settingsViewModel)
        }
    }
    
    var onboardingBody: some View {
        WizardView()
            .environmentObject(settingsViewModel)
    }
}

#Preview {
    ContentView()
}
