//
//  DefaultStepper.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 02.04.24.
//

import Foundation
import SwiftUI

struct DefaultStepper<Label: View, Style: MDSNumericStepperStyle>: View {
    @Binding var value: Int
    var `in`: ClosedRange<Int>
    @ViewBuilder var label: Label
    var style: Style
    var step: Int
    
    var body: some View {
        style.body(.init(value: $value, label: .init(underlyingLabel: AnyView(label)), range: `in`, step: step))
    }
}

public struct DefaultStepperStyle: MDSNumericStepperStyle {
    func body(_ configuration: MDSNumericStepperStyleConfiguration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Button(action: configuration.onDecrement) { subtractIcon }
                .buttonRepeatBehavior(.enabled)
                .disabled(configuration.atLowerBound)
            Text(configuration.description)
                .font(.system(.body, design: .rounded, weight: .regular))
                .frame(width: 32)
            Button(action: configuration.onIncrement) { addIcon }
                .buttonRepeatBehavior(.enabled)
                .disabled(configuration.atUpperBound)
        }
    }
    
    private var subtractIcon: some View {
        Image(systemName: "minus")
            .font(.system(.caption, design: .rounded, weight: .regular))
            .frame(width: 32, height: 32, alignment: .center)
            .foregroundStyle(.secondary)
            .background {
                Circle()
                    .stroke(lineWidth: 1.0)
                    .foregroundStyle(.secondary)
            }
    }
    
    private var addIcon: some View {
        Image(systemName: "plus")
            .font(.system(.caption, design: .rounded, weight: .regular))
            .frame(width: 32, height: 32, alignment: .center)
            .foregroundStyle(.secondary)
            .background {
                Circle()
                    .stroke(lineWidth: 1.0)
                    .foregroundStyle(.secondary)
            }
    }
}
