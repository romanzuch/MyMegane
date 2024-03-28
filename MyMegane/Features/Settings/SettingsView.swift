//
//  SettingsView.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 23.03.24.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("activeIcon") var activeIcon: String = "Default"
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundGradient()
                Form {
                    Section("Fahrzeugeinstellungen") {
                        Picker("Model", selection: $settingsViewModel.model) {
                            ForEach(MeganeModel.allCases, id: \.self) { model in
                                Text(model.name)
                                    .tag(model)
                            }
                        }
                        .pickerStyle(.navigationLink)
                        Picker("Farbe", selection: $settingsViewModel.color) {
                            ForEach(settingsViewModel.model.color, id: \.self) { color in
                                Text(color.name)
                                    .tag(color)
                            }
                        }
                        .pickerStyle(.navigationLink)
                        Picker("Dachfarbe", selection: $settingsViewModel.roof) {
                            ForEach(settingsViewModel.color.availableRoofs, id: \.self) { roof in
                                Text(roof.name)
                                    .tag(roof)
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                    Section("Appeinstellungen") {
                        Picker(selection: $activeIcon) {
                            ForEach(AppIcon.allCases, id: \.self) { icon in
                                Text(icon.name)
                                    .tag(icon.name)
                            }
                        } label: {
                            Text("Appsymbol")
                        }
                        .pickerStyle(.navigationLink)
                        HStack {
                            Text("Appeinführung")
                            Spacer()
                            Button(action: {
                                settingsViewModel.showOnboardingWizard = true
                            }, label: {
                                Text("Erneut anzeigen")
                            })
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .onChange(of: activeIcon, { oldValue, newValue in
                if newValue == "Standard" {
                    UIApplication.shared.setAlternateIconName(nil)
                } else {
                    UIApplication.shared.setAlternateIconName(newValue)
                }
            })
            .onChange(of: settingsViewModel.model, { oldValue, newValue in
                settingsViewModel.saveModel(newValue)
            })
            .onChange(of: settingsViewModel.color, { oldValue, newValue in
                settingsViewModel.saveColor(newValue)
            })
            .onChange(of: settingsViewModel.roof, { oldValue, newValue in
                settingsViewModel.saveRoof(newValue)
            })
            .onChange(of: settingsViewModel.showOnboardingWizard, { oldValue, newValue in
                settingsViewModel.saveWizard(newValue)
            })
            .navigationTitle("Einstellungen")
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(SettingsViewModel())
}
