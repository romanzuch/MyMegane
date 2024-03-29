//
//  ChargingModeSelectionView.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 28.03.24.
//

import SwiftUI

struct ChargingModeSelectionView: View {
    
    @Environment (\.dismiss) var dismiss
    @Binding var chargingMode: ChargingMode
    @State private var tempChargingMode: ChargingMode = .immediate
    @State private var tempChargingPlans: [ChargingPlan] = []
    @EnvironmentObject var _settingsViewModel: SettingsViewModel
    var settingsViewModel: SettingsViewModel
    
    init(_ settingsViewModel: SettingsViewModel, chargingMode mode: Binding<ChargingMode>) {
        self.settingsViewModel = settingsViewModel
        self._tempChargingMode = State(initialValue: settingsViewModel.chargingMode)
        self._tempChargingPlans = State(initialValue: settingsViewModel.chargingPlans)
        self._chargingMode = mode
    }
    
    var body: some View {
        VStack(spacing: 8) {
            
            // Header
            
            ZStack {
                HStack {
                    Spacer()
                    Text("Ladesteuerung")
                        .font(.system(.title3, design: .rounded, weight: .bold))
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32, alignment: .center)
                    })
                    .buttonStyle(.plain)
                    .padding(.trailing)
                }
            }
            
            // Picker
            
            HStack {
                ForEach(ChargingMode.allCases, id: \.self) { mode in
                    VStack(spacing: 16) {
                        Text(mode.rawValue)
                            .font(.system(.caption, design: .rounded, weight: .bold))
                        Image(systemName: mode.icon)
                    }
                    .padding()
                    .containerRelativeFrame(.horizontal, count: 3, spacing: 16.0)
                    .frame(height: 100)
                    .background(.ultraThinMaterial.opacity(tempChargingMode == mode ? 1.0 : 0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .onTapGesture {
                        tempChargingMode = mode
                    }
                }
            }
            
            // Details
            VStack {
                HStack {
                    Spacer()
                    Text(tempChargingMode.description)
                        .font(.system(.body, design: .rounded, weight: .regular))
                        .padding(.vertical)
                        .padding(.horizontal, 8)
                    Spacer()
                }
                switch tempChargingMode {
                case .immediate:
                    EmptyView()
                case .delayed:
                    VStack {
                        DatePicker("", selection: $_settingsViewModel.delayedChargingDate, displayedComponents: .hourAndMinute)
                            .datePickerStyle(.wheel)
                            .labelsHidden()
                        HStack {
                            Text("Ladelimit")
                            Spacer()
                            Picker("Ladelimit", selection: $_settingsViewModel.chargingLimit) {
                                ForEach(Array(settingsViewModel.chargeLimitRange), id: \.self) { step in
                                    Text("\(step) %")
                                }
                            }
                        }
                        .padding(.horizontal, 8)
                    }
                    .scrollContentBackground(.hidden)
                    .padding(.bottom)
                case .planning:
                    VStack {
                        ForEach(Array(tempChargingPlans.enumerated()), id: \.element.id) { index, plan in
                            ChargingPlanView(plan)
                        }
                        Button(action: {
                            tempChargingPlans.append(ChargingPlan())
                        }, label: {
                            Text("Neuer Plan")
                        })
                        .padding(.bottom)
                    }
                }
            }
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal, 8)
            
            // Footer
            
            Spacer()
            Button(action: {
                self.chargingMode = self.tempChargingMode
                self.settingsViewModel.saveChargingMode(self.tempChargingMode)
                self.dismiss()
            }, label: {
                Text("Speichern")
            })
        }
    }

}

#Preview {
    ChargingModeSelectionView(SettingsViewModel(), chargingMode: .constant(.planning))
        .environmentObject(SettingsViewModel())
}
