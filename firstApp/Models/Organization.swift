//
//  Organization.swift
//  firstApp
//
//  Created by apple on 03/01/2025.
//

import Foundation

// MARK: - User Struct
struct Userr {
    var id: Int
    var name: String
    var password: String
    var category: String // Admin or Employee
}

// MARK: - Employee Struct
struct Employee {
    var id: Int
    var employeeName: String
    var department: String // HR, Training, IT and Software, Accounts
    var role: String       // Manager, Trainer, Worker
    var assignedProject: String
}
