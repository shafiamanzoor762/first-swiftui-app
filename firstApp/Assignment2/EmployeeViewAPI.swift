//
//  EmployeeViewAPI.swift
//  firstApp
//
//  Created by apple on 20/01/2025.
//


import SwiftUI

struct EmployeeViewAPI: View {
    @State var id: String = ""
    @State var employeeName: String = ""
    @State var dpt = ["HR", "Training", "IT and Software", "Accounts"]
    @State var role = ["Manager", "Trainer", "Worker"]
    @State var dptSelectedText: String = ""
    @State var roleSelectedText: String = ""
    
    @State private var navigateToDetails = false
    @State private var selectedEmployee: Employee? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Employee")
                    .font(.largeTitle)
                    .padding()
                
                // Emp Id Field
                Text("Emp Id").bold()
                TextField("", text: $id)
                    .frame(height: 35)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .border(.gray, width: 1)
                    .cornerRadius(5)
                    .shadow(radius: 5)
                    .padding()
                
                // Emp Name Field
                Text("Emp Name")
                TextField("", text: $employeeName)
                    .frame(height: 35)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .border(.gray, width: 1)
                    .cornerRadius(5)
                    .shadow(radius: 5)
                    .padding()
                
                // Department Dropdown
                Text("Department")
                DropDown(options: dpt, selectedOption: $dptSelectedText)
                
                // Role Dropdown
                Text("Role")
                DropDown(options: role, selectedOption: $roleSelectedText)
                
                // Add Button
                Button(action: {
                    let api = APIHelper()
                    // Ensure the ID and Name fields are not empty before saving
                    if let employeeId = Int(id), !employeeName.isEmpty, !dptSelectedText.isEmpty, !roleSelectedText.isEmpty {
                        let employee = Employeee(
                            id: Int(id) ?? 0,
                            empName: employeeName,
                            department: dptSelectedText,
                            role: roleSelectedText,
                            assignedProject: ""
                        )
                        
                        let jsonData = try! JSONEncoder().encode(employee)
                        let response = api.postMethodCall(controllerName: "Contacts", actionName: "SaveEmployee", httpBody: jsonData, completion: {
                            response in
                            if response.responseCode == 200{
                                print("Saved")
                            }else{
                                print("Error-> \(response.responseMessage)")
                            }
                        })
                        navigateToDetails = true
                        
                    } else {
                        print("Please fill in all fields.")
                    }
                }, label: {
                    Text("Add")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 35)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                .padding()
                
                NavigationLink(
                    destination: EmployeeDetailView(employeeName: employeeName, dptSelectedText: dptSelectedText, roleSelectedText: roleSelectedText),
                    isActive: $navigateToDetails,
                    label: { EmptyView() }
                )
                
            }
            .padding()
        }
    }
}


#Preview {
    EmployeeViewAPI()
}
