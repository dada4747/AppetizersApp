//
//  File.swift
//  Appetizers
//
//  Created by Rahul on 13/07/25.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    /*final*/ func saveChanges(){
        guard isvalidForm else { return }
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSucess
        }catch {
            alertItem = AlertContext.invalideUserData
        }
        print("Changes have been saved sucessfully")
    }
    
    func retrieveUser(){
        guard let userData = userData else{return}
        
        do{
            user = try JSONDecoder().decode(User.self, from: userData)
        }catch{
            alertItem = AlertContext.invalideUserData
        }
    }
    
    var isvalidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalideEmail
            return false
        }
        return true
    }
    
}

