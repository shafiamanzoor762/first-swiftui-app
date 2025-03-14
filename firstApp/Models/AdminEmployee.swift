//
//  AdminEmployee.swift
//  firstApp
//
//  Created by apple on 22/01/2025.
//

import Foundation
struct Userrr: Codable{
    var id:Int
    var name:String?
    var password:String?
    var category:String?
}

struct Employeee: Codable{
    var id:Int = 0
    var empName:String?
    var department:String?
    var role:String?
    var assignedProject:String?
}
