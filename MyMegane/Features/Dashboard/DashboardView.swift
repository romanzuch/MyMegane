//
//  DashboardView.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 22.03.24.
//

import SwiftUI

struct DashboardView: View {
    
    // General
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    private let cardHeight: CGFloat = 128.0
    
    // Car Information
    @State private var carInformationSheetIsDisplayed: Bool = false
    
    // Car Location
    @State private var locateCarModeIsEnabled: Bool = false
    
    // Charging Control / History
    @State private var chargingMode: ChargingMode = .immediate
    @State private var chargingModeSheetIsDisplayed: Bool = false
    @State private var chargingHistorySheetIsDisplayed: Bool = false
    
    // Climate Control
    @State private var climateProgrammIsEnabled: Bool = false
    @State private var climateProgrammSheetIsDisplayed: Bool = false
    @State private var climateControlIsEnabled: Bool = false
    var rotationAnimation: Animation {
        Animation.linear(duration: 0.4)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        ZStack {
            // MARK: - Background
            BackgroundGradient()
            
            // MARK: - Title & Image
            ZStack {
                VStack {
                    HStack {
                        Text(settingsViewModel.model.name)
                            .font(.system(size: 56, design: .rounded))
                            .fontWeight(.black)
                        Spacer()
                    }
                    .padding(.leading, 40)
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Image(settingsViewModel.getImageName())
                        .resizable()
                        .scaledToFit()
                    
                    // MARK: - Cards
                    VStack(alignment: .leading) {
                        Text("Batteriezustand")
                            .font(.system(.caption, design: .rounded, weight: .bold))
                        Spacer()
                        HStack {
                            HStack(spacing: 4) {
                                Text("84")
                                    .font(.system(size: 56, weight: .black, design: .rounded))
                                Text("%")
                                    .font(.system(.caption, design: .rounded, weight: .bold))
                                    .offset(y: 12.0)
                            }
                            Spacer()
                            HStack(spacing: 4) {
                                Text("353")
                                    .font(.system(size: 40, weight: .black, design: .rounded))
                                Text("km")
                                    .font(.system(.caption, design: .rounded, weight: .bold))
                                    .offset(y: 12.0)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                    .frame(height: cardHeight)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Ladesteuerung")
                                    .font(.system(.caption, design: .rounded, weight: .bold))
                                Spacer()
                                HStack {
                                    Spacer()
                                    Image(systemName: "bolt.batteryblock")
                                        .font(.system(.largeTitle, design: .rounded, weight: .regular))
                                    Spacer()
                                }
                                Spacer()
                                HStack {
                                    Text(chargingMode.rawValue)
                                        .font(.system(.caption2, design: .rounded, weight: .regular))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.system(.caption2, design: .rounded, weight: .regular))
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                            .frame(height: cardHeight)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .containerRelativeFrame(.horizontal, count: 2, spacing: 32.0)
                            .onTapGesture {
                                chargingModeSheetIsDisplayed.toggle()
                            }
                            .fullScreenCover(isPresented: $chargingModeSheetIsDisplayed, content: {
                                VStack {
                                    Text("Ladesteuerung")
                                    Button(action: {
                                        chargingModeSheetIsDisplayed.toggle()
                                    }, label: {
                                        Text("Schließen")
                                    })
                                }
                                .presentationBackground(.ultraThinMaterial)
                            })
                            
                            VStack(alignment: .leading) {
                                Text("Ladehistorie")
                                    .font(.system(.caption, design: .rounded, weight: .bold))
                                Spacer()
                                HStack {
                                    Spacer()
                                    Image(systemName: "bolt.badge.clock.fill")
                                        .font(.system(.largeTitle, design: .rounded, weight: .regular))
                                    Spacer()
                                }
                                Spacer()
                                HStack {
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.system(.caption2, design: .rounded, weight: .regular))
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                            .frame(height: cardHeight)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .containerRelativeFrame(.horizontal, count: 2, spacing: 32.0)
                            .onTapGesture {
                                chargingHistorySheetIsDisplayed.toggle()
                            }
                            .fullScreenCover(isPresented: $chargingHistorySheetIsDisplayed, content: {
                                VStack {
                                    Text("Ladehistorie")
                                    Button(action: {
                                        chargingHistorySheetIsDisplayed.toggle()
                                    }, label: {
                                        Text("Schließen")
                                    })
                                }
                                .presentationBackground(.ultraThinMaterial)
                            })
                            
                            VStack(alignment: .leading) {
                                Text("Klimaprogramm")
                                    .font(.system(.caption, design: .rounded, weight: .bold))
                                Spacer()
                                HStack {
                                    Spacer()
                                    Image(systemName: "fanblades")
                                        .font(.system(.largeTitle, design: .rounded, weight: .regular))
                                    Spacer()
                                }
                                Spacer()
                                HStack {
                                    Text(climateProgrammIsEnabled ? "Aktiviert" : "Deaktiviert")
                                        .font(.system(.caption2, design: .rounded, weight: .regular))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.system(.caption2, design: .rounded, weight: .regular))
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                            .frame(height: cardHeight)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .containerRelativeFrame(.horizontal, count: 2, spacing: 32.0)
                            .onTapGesture {
                                climateProgrammSheetIsDisplayed.toggle()
                            }
                            .fullScreenCover(isPresented: $climateProgrammSheetIsDisplayed, content: {
                                VStack {
                                    Text("Klimaprogramm")
                                    Button(action: {
                                        climateProgrammSheetIsDisplayed.toggle()
                                    }, label: {
                                        Text("Schließen")
                                    })
                                }
                                .presentationBackground(.ultraThinMaterial)
                            })
                            
                            VStack(alignment: .leading) {
                                Text("Fahrzeuginformation")
                                    .font(.system(.caption, design: .rounded, weight: .bold))
                                Spacer()
                                HStack {
                                    Spacer()
                                    Image(systemName: "list.dash.header.rectangle")
                                        .font(.system(.largeTitle, design: .rounded, weight: .regular))
                                    Spacer()
                                }
                                Spacer()
                                HStack {
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.system(.caption2, design: .rounded, weight: .regular))
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                            .frame(height: cardHeight)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .containerRelativeFrame(.horizontal, count: 2, spacing: 32.0)
                            .onTapGesture {
                                carInformationSheetIsDisplayed.toggle()
                            }
                            .fullScreenCover(isPresented: $carInformationSheetIsDisplayed, content: {
                                VStack {
                                    Text("Fahrzeuginformation")
                                    Button(action: {
                                        carInformationSheetIsDisplayed.toggle()
                                    }, label: {
                                        Text("Schließen")
                                    })
                                }
                                .presentationBackground(.ultraThinMaterial)
                            })
                        }
                    }
                    .padding(.horizontal, 16)
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.paging)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Klimatisierung")
                                .font(.system(.caption, design: .rounded, weight: .bold))
                            Spacer()
                            HStack {
                                Spacer()
                                Image(systemName: "fanblades")
                                    .font(.system(.largeTitle, design: .rounded, weight: .regular))
                                    .rotationEffect(climateControlIsEnabled ? Angle(degrees: 90.0) : Angle(degrees: 0.0))
                                    .animation(climateControlIsEnabled ? rotationAnimation : .default, value: climateControlIsEnabled)
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text(climateControlIsEnabled ? "Ein" : "Aus")
                                    .font(.system(.caption2, design: .rounded, weight: .regular))
                                Spacer()
                                Toggle("Klimatisierung", isOn: $climateControlIsEnabled)
                                    .labelsHidden()
                                    .controlSize(.mini)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        .frame(height: cardHeight)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .containerRelativeFrame(.horizontal, count: 2, spacing: 32)
                        
                        VStack(alignment: .leading) {
                            Text("Fahrzeug lokalisieren")
                                .font(.system(.caption, design: .rounded, weight: .bold))
                            Spacer()
                            HStack {
                                Spacer()
                                Image(systemName: "location.viewfinder")
                                    .font(.system(.largeTitle, design: .rounded, weight: .regular))
                                    .symbolEffect(.bounce, value: locateCarModeIsEnabled)
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text("")
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        .frame(height: cardHeight)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .containerRelativeFrame(.horizontal, count: 2, spacing: 32)
                        .onTapGesture {
                            locateCarModeIsEnabled.toggle()
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    Spacer()
                }
                .padding(.top, 54)
            }
            
        }
    }
}

#Preview {
    DashboardView()
        .environmentObject(SettingsViewModel())
}
