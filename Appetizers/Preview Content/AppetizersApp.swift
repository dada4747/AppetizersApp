//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Rahul on 10/07/25.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
