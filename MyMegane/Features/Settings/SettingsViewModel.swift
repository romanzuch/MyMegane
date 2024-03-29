//
//  SettingsViewModel.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 23.03.24.
//

import Foundation

class SettingsViewModel: ObservableObject {
    @Published var model: MeganeModel = .comfort130
    @Published var color: MeganeColor = .blackPearl
    @Published var roof: MeganeRoof = .body
    @Published var showOnboardingWizard: Bool = true
    @Published var chargingMode: ChargingMode = .immediate
    
    init() {
        if let model = UserDefaults.standard.string(forKey: "model") {
            self.model = MeganeModel(rawValue: model) ?? .comfort130
        }
        if let color = UserDefaults.standard.string(forKey: "color") {
            self.color = MeganeColor(rawValue: color) ?? .nachtBlau
        }
        if let roof = UserDefaults.standard.string(forKey: "roof") {
            self.roof = MeganeRoof(rawValue: roof) ?? .body
        }
        if let mode = UserDefaults.standard.string(forKey: "chargingMode") {
            self.chargingMode = ChargingMode(rawValue: mode) ?? .immediate
        }
        self.showOnboardingWizard = UserDefaults.standard.bool(forKey: "showOnboardingWizard")
    }
}

extension SettingsViewModel {
    func getImageName() -> String {
        return "\(roof.imagePrefix)\(color.imageName)"
    }
    func saveModel(_ model: MeganeModel) {
        UserDefaults.standard.setValue(model.name, forKey: "model")
    }
    func saveColor(_ color: MeganeColor) {
        UserDefaults.standard.setValue(color.name, forKey: "color")
    }
    func saveRoof(_ roof: MeganeRoof) {
        UserDefaults.standard.setValue(roof.name, forKey: "roof")
    }
    func saveWizard(_ wizard: Bool) {
        UserDefaults.standard.setValue(wizard, forKey: "showOnboardingWizard")
    }
    func saveChargingMode(_ mode: ChargingMode) {
        self.chargingMode = mode
        UserDefaults.standard.setValue(mode.rawValue, forKey: "chargingMode")
    }
}
