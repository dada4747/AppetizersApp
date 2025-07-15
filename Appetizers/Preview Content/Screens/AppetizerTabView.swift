//
//  AppetizerTabView.swift
//  Appetizers
//
//  Created by Rahul on 10/07/25.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizersListView()
                .tabItem { Label("Home", systemImage: "house") }
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            
            OrderView()
                .tabItem { Label("Orders", systemImage: "bag") }
        }
        .accentColor(.brandPrimary)
        
    }
}

#Preview {
    AppetizerTabView()
}
