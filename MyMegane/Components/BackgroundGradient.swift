//
//  BackgroundGradient.swift
//  MyMegane
//
//  Created by Roman Zuchowski on 28.03.24.
//

import SwiftUI

struct BackgroundGradient: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.white, .black.opacity(0.7)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
    }
}

#Preview {
    BackgroundGradient()
}
