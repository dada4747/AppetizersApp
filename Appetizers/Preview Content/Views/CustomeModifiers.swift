//
//  CustomeModifiers.swift
//  Appetizers
//
//  Created by Rahul on 14/07/25.
//

import SwiftUI

struct StanderdButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
        .buttonStyle(.bordered)
        .tint(.brandPrimary)
        .controlSize(.large)
    }
}

extension View {
    func standerdButtonStyle() -> some View {
        self.modifier(StanderdButtonStyle())
    }
    
}
