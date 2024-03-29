//
//  ChargingPlanView.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 29.03.24.
//

import SwiftUI

struct ChargingPlanView: View {
    
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    @State private var chargingPlan: ChargingPlan
    @State private var startDate: Date = Date.now
    @State private var endDate: Date = Date.now
    
    init(_ plan: ChargingPlan) {
        self._chargingPlan = State(initialValue: plan)
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Array(zip(settingsViewModel.weekdays.indices, settingsViewModel.weekdays)), id: \.0) { index, weekday in
                    if index > 0 {
                        Spacer()
                    }
                    Button(action: {
                        if chargingPlan.days.contains(weekday) {
                            let index = chargingPlan.days.firstIndex(of: weekday)
                            chargingPlan.days.remove(at: index!)
                        } else {
                            chargingPlan.days.append(weekday)
                        }
                    }, label: {
                        Text(weekday)
                            .font(.system(.caption, design: .rounded, weight: .regular))
                            .padding(8)
                            .background((chargingPlan.days.contains(weekday)) ? Color.blue.background(.ultraThinMaterial) : Color.clear.background(.ultraThinMaterial))
                            .clipShape(Circle())
                    })
                    .buttonStyle(.plain)
                }
            }
            .padding(.bottom, 8)
            DatePicker("Start", selection: $startDate, displayedComponents: .hourAndMinute)
                .font(.system(.body, design: .rounded, weight: .regular))
            DatePicker("Ende", selection: $endDate, displayedComponents: .hourAndMinute)
                .font(.system(.body, design: .rounded, weight: .regular))
        }
        .padding(.horizontal)
    }
}

#Preview {
    ChargingPlanView(ChargingPlan())
        .environmentObject(SettingsViewModel())
}
