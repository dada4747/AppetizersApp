//
//  Alert.swift
//  Appetizers
//
//  Created by Rahul on 11/07/25.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id: UUID = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    static let invalidData = AlertItem(
        title: Text("Server Error"),
        message: Text("The data received from the server was invalid. Please contact support."),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidResponse = AlertItem(
        title: Text("Server Error"),
        message: Text("Invalid response from the server. Please try again later or contact support."),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidURL = AlertItem(
        title: Text("Server Error"),
        message: Text("There was an issue connecting to the server. If this persists, plese contact support."),
        dismissButton: .default(Text("OK"))
    )
    
    static let unableToComplete = AlertItem(
        title: Text("Server Error"),
        message: Text("Unable to complete your request at this time. Please check your internet connection"),
        dismissButton: .default(Text("OK"))
    )
//    MARK: -  Account Alert
    static let invalidForm = AlertItem(
        title: Text("Invalid From"),
        message: Text("Pleae insure all fields in the form have been filled out."),
        dismissButton: .default(Text("OK"))
    )
    static let invalideEmail = AlertItem(
        title: Text("Invalid Email"),
        message: Text("Please enter a valid email address."),
        dismissButton: .default(Text("OK"))
    )
    static let userSaveSucess = AlertItem(
        title: Text("Profile Saved"),
        message: Text("Your profile information was saved successfully."),
        dismissButton: .default(Text("OK"))
    )
    static let invalideUserData = AlertItem(
        title: Text("Profile Error"),
        message: Text("There was an error saveing or retrivining your profile."),
        dismissButton: .default(Text("OK"))
    )
}
