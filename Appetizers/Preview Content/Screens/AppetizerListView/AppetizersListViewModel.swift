//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by Rahul on 11/07/25.
//

import Foundation
@MainActor final class AppetizersListViewModel: ObservableObject {
    @Published var appetizers : [Appetizer] = []
    @Published var alerItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?

//    func getAppetizers() {
//        isLoading = true
//        NetworkManager.shared.getAppetizers { result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//                    case.invalidResponse:
//                        self.alerItem = AlertContext.invalidResponse
//                        
//                    case.invalidURL:
//                        self.alerItem = AlertContext.invalidURL
//                        
//                    case.invalideData:
//                        self.alerItem = AlertContext.invalidData
//                        
//                    case .unableToComplete:
//                        self.alerItem = AlertContext.unableToComplete
//                        
//                    case .unableToDecode:
//                        self.alerItem = AlertContext.invalidData
//                    }
//                }
//            }
//        }
//    }
    
    func getAppetizers()  {
        isLoading = true
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            }catch {
                if let apError = error as? APError {
                    switch apError {
                    case.invalidResponse:
                        self.alerItem = AlertContext.invalidResponse
                        
                    case.invalidURL:
                        self.alerItem = AlertContext.invalidURL
                        
                    case.invalideData:
                        self.alerItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        self.alerItem = AlertContext.unableToComplete
                        
                    case .unableToDecode:
                        self.alerItem = AlertContext.invalidData
                        
                    }
                } else {
                    alerItem = AlertContext.invalidResponse
                }

                isLoading = false
            }
        }
    }
}
