//
//  EmployeeViewModel.swift
//  firstApp
//
//  Created by apple on 08/11/2024.
//

import Foundation

class EmployeeViewModel: ObservableObject{
    
    @Published var Option: String = "Radio Button 1"
    @Published var Id: String = ""
    @Published var Name:String = ""
    @Published var Salary:String = ""
    
    @Published var EmpCount:Int = 0
    
    func calculateTotal(){
        EmpCount = EmpCount + 1
    }
}
