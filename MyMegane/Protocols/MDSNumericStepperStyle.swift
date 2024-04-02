//
//  MDSNumericStepperStyle.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 02.04.24.
//

import Foundation
import SwiftUI

protocol MDSNumericStepperStyle {
    associatedtype Body: View
    func body(_ configuration: MDSNumericStepperStyleConfiguration) -> Body
}

struct MDSNumericStepperStyleConfiguration {
    var value: Binding<Int>
    var label: Label
    var range: ClosedRange<Int>
    var step: Int
    
    var description: String {
        String(value.wrappedValue)
    }
    
    var atLowerBound: Bool {
        value.wrappedValue == range.lowerBound
    }
    
    var atUpperBound: Bool {
        value.wrappedValue == range.upperBound
    }
    
    func onDecrement() {
        if (value.wrappedValue + step) >= range.lowerBound {
            value.wrappedValue -= step
        }
    }
    
    func onIncrement() {
        if (value.wrappedValue + step) <= range.upperBound {
            value.wrappedValue += step
        }
    }
    
    struct Label: View {
        var underlyingLabel: AnyView
        
        var body: some View {
            underlyingLabel
        }
    }
}
