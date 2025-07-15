//
//  SecureStoreProtocol.swift
//  Appetizers
//
//  Created by Rahul on 15/07/25.
//


// 🔐 SecureLoginManager.swift
import Foundation
import Security

protocol SecureStoreProtocol {
    func save(key: String, value: String)
    func retrieve(key: String) -> String?
    func delete(key: String)
}

final class KeychainStore: SecureStoreProtocol {
    func save(key: String, value: String) {
        let data = value.data(using: .utf8)!
        let query = [kSecClass: kSecClassGenericPassword,
                     kSecAttrAccount: key,
                     kSecValueData: data] as CFDictionary

        SecItemDelete(query)
        SecItemAdd(query, nil)
    }

    func retrieve(key: String) -> String? {
        let query = [kSecClass: kSecClassGenericPassword,
                     kSecAttrAccount: key,
                     kSecReturnData: true,
                     kSecMatchLimit: kSecMatchLimitOne] as CFDictionary

        var result: AnyObject?
        let status = SecItemCopyMatching(query, &result)
        if status == errSecSuccess, let data = result as? Data {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }

    func delete(key: String) {
        let query = [kSecClass: kSecClassGenericPassword,
                     kSecAttrAccount: key] as CFDictionary
        SecItemDelete(query)
    }
}

// 🔐 JWTDecoder.swift
import Foundation

struct JWTDecoder {
    static func decodePayload(from token: String) -> [String: Any]? {
        let segments = token.components(separatedBy: ".")
        guard segments.count > 1 else { return nil }

        let payload = segments[1]
        var base64 = payload.replacingOccurrences(of: "-", with: "+")
                              .replacingOccurrences(of: "_", with: "/")
        while base64.count % 4 != 0 { base64 += "=" }

        guard let data = Data(base64Encoded: base64),
              let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return nil
        }
        return json
    }
}

// 🔐 AuthViewModel.swift
import Foundation

final class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = false
    private let store: SecureStoreProtocol

    init(store: SecureStoreProtocol = KeychainStore()) {
        self.store = store
        checkLoginState()
    }

    func login(username: String, password: String) {
        // Dummy JWT response (normally from server)
        let jwt = "header.eyJ1c2VySWQiOiIxMjMiLCJleHAiOjQ3ODg4ODg4OH0.signature"
        store.save(key: "access_token", value: jwt)
        checkLoginState()
    }

    func logout() {
        store.delete(key: "access_token")
        isLoggedIn = false
    }

    private func checkLoginState() {
        guard let token = store.retrieve(key: "access_token"),
              let payload = JWTDecoder.decodePayload(from: token),
              let exp = payload["exp"] as? TimeInterval else {
            isLoggedIn = false
            return
        }
        isLoggedIn = exp > Date().timeIntervalSince1970
    }
}

// 🔐 AuthView.swift (SwiftUI)
import SwiftUI

struct AuthView: View {
    @StateObject private var vm = AuthViewModel()

    var body: some View {
        VStack(spacing: 20) {
            if vm.isLoggedIn {
                Text("✅ Logged In Securely")
                Button("Logout") { vm.logout() }
            } else {
                Button("Login") {
                    vm.login(username: "test", password: "1234")
                }
            }
        }
        .font(.title2)
        .padding()
    }
}
