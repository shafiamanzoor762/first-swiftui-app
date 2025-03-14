//
//  EmployeesByDepartmentViewAPI.swift
//  firstApp
//
//  Created by apple on 20/01/2025.
//


import SwiftUI

struct EmployeeCountViewAPI: View {
    @State var departmentCounts: [String: Int] = [
        "HR": 0,
        "Training": 0,
        "IT and Software": 0,
        "Accounts": 0
    ]
    
    var body: some View {
        VStack {
            Text("Employee Count by Department")
                .font(.headline)
                .padding()
            
            ForEach(["HR", "Training", "IT and Software", "Accounts"], id: \.self) { department in
                HStack {
                    Text(department)
                    Spacer()
                    Text("\(departmentCounts[department, default: 0])")
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
        .onAppear {
            loadDepartmentCounts()
        }
    }
    
    func loadDepartmentCounts() {
        
        // Update the state
        for (department, count) in departmentCounts {
            departmentCounts[department] = count
        }
    }
}

#Preview {
    EmployeeCountViewAPI()
}
