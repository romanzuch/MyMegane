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
    var settingsViewModel: SettingsViewModel
    
    init(_ settingsViewModel: SettingsViewModel, chargingMode mode: Binding<ChargingMode>) {
        self.settingsViewModel = settingsViewModel
        self._tempChargingMode = State(initialValue: mode.wrappedValue)
        self._chargingMode = mode
    }
    
    var body: some View {
        VStack(spacing: 16) {
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
            Text(tempChargingMode.description)
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
    ChargingModeSelectionView(SettingsViewModel(), chargingMode: .constant(.delayed))
}
