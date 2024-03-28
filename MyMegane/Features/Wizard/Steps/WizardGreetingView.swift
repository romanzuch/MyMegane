//
//  WizardGreetingView.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 23.03.24.
//

import SwiftUI

struct WizardGreetingView: View {
    
    @EnvironmentObject var wizardViewModel: WizardViewModel
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Hallo bei MyMegane")
                    .font(.system(
                        size: 64,
                        weight: .bold,
                        design: .rounded
                    ))
                Spacer()
            }
            .padding(.bottom, 32)
            HStack {
                Text("Der neuen App von Renault zur Verwaltung Ihres Renault Megane E-Tech.")
                    .font(.callout)
                    .fontDesign(.rounded)
                Spacer()
            }
            HStack {
                Text("In den nächsten Schritten werden wir gemeinsam die App für Sie einrichten und alle wichtigen Features erklären. ")
                    .font(.callout)
                    .fontDesign(.rounded)
                Spacer()
            }
            Spacer()
            Button(action: {
                if wizardViewModel.currentWizardStep < wizardViewModel.onboardingViews.count - 1 {
                    withAnimation {
                        wizardViewModel.currentWizardStep += 1
                    }
                } else {
                    settingsViewModel.showOnboardingWizard = false
                }
            }, label: {
                Text("Los!")
                    .fontDesign(.rounded)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            })
            .buttonStyle(.plain)
        }
        .padding(.horizontal)
        .padding(.top, 40)
        .foregroundStyle(.black)
    }
}

#Preview {
    WizardGreetingView()
        .environmentObject(WizardViewModel())
        .environmentObject(SettingsViewModel())
}
