//
//  User.swift
//  Appetizers
//
//  Created by Rahul on 13/07/25.
//

import Foundation

struct User : Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthdate: Date = Date()
    var extraNapkins = false
    var frequientRefills = false
}
