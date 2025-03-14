import SwiftUI
//
//struct AdminViewLabTask: View {
//    @State var search: String = ""
//    @State var id: String = ""
//    @State var name: String = ""
//    @State var role: String = ""
//    @State var project: String = ""
//    @State var departmentCounts: [String: Int] = [:]
//    @State var SelectedOption : String = "Save"
//    @State var options : [String] = ["Save", "Update","Delete"]
//    var dbHandler = DBHandler()
//    
//    @State var navigateToReport = false
//    
//    var body: some View {
//        VStack {
//            // Search Section
//            HStack {
//                TextField("Search here", text: $search)
//                    .padding(.leading, 10)
//                    .frame(height: 35)
//                    .frame(maxWidth: .infinity)
//                    .background(.white)
//                    .cornerRadius(5)
//                    .overlay(
//                        HStack {
//                            Spacer()
//                            Button(action: {
//                                performSearch()
//                            }) {
//                                Image(systemName: "magnifyingglass.circle")
//                                    .foregroundColor(.gray)
//                                    .padding(.trailing, 10)
//                            }
//                        }
//                    )
//                    .shadow(radius: 5)
//                    .padding()
//            }
//            
//            // Input Fields
//            Group {
//                HStack {
//                    Text("Emp ID")
//                    TextField("", text: $id)
//                        .frame(height: 35)
//                        .background(.white)
//                        .border(.gray, width: 1)
//                        .cornerRadius(5)
//                        .shadow(radius: 5)
//                        .padding()
//                }
//                
//                HStack {
//                    Text("Emp Name")
//                    TextField("", text: $name)
//                        .frame(height: 35)
//                        .background(.white)
//                        .border(.gray, width: 1)
//                        .cornerRadius(5)
//                        .shadow(radius: 5)
//                        .padding()
//                }
//                
//                HStack {
//                    Text("Role")
//                    TextField("", text: $role)
//                        .frame(height: 35)
//                        .background(.white)
//                        .border(.gray, width: 1)
//                        .cornerRadius(5)
//                        .shadow(radius: 5)
//                        .padding()
//                }
//                
//                HStack {
//                    Text("Project")
//                    TextField("", text: $project)
//                        .frame(height: 35)
//                        .background(.white)
//                        .border(.gray, width: 1)
//                        .cornerRadius(5)
//                        .shadow(radius: 5)
//                        .padding()
//                }
//            }
//            DropDown(options: options, selectedOption: $SelectedOption)
//            // Buttons Section
//            HStack {
//                Button(action: {
//                    if SelectedOption == "Save"{
//                        saveEmployee()
//                    }
//                    if  SelectedOption == "Update"{
//                        
//                    }
//                    if SelectedOption == "Delete"{
//                        
//                    }
//                }) {
//                    Text("Apply")
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(width: 200, height: 35)
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                
//                Button(action: {
//                    generateReport()
//                }) {
//                    Text("Generate Report")
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(width: 200, height: 35)
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//            }
//            .padding()
//            
//            
//            // Navigation to EmployeeCountView
//            NavigationLink(
//                destination: EmployeeCountView(departmentCounts: departmentCounts),
//                isActive: $navigateToReport
//            ) {
//                EmptyView()
//            }
//        }
//        .padding()
//    }
//    
//    // MARK: - Helper Functions
//    
//    func performSearch() {
//        guard !search.isEmpty else { return }
//        let employee = dbHandler.getEmployeeById(employeeId: Int(search)!)
//        if (employee != nil){
//            id = "\(employee?.id ?? 0)"
//            name = employee?.employeeName ?? ""
//            role = employee?.role ?? ""
//            project = employee?.assignedProject ?? ""
//        }
//    }
//    
//    func saveEmployee() {
//        guard let employeeId = Int(id), !name.isEmpty, !role.isEmpty, !project.isEmpty else {
//            print("All fields are required.")
//            return
//        }
//        
//        let employee = Employee(
//            id: employeeId,
//            employeeName: name,
//            department: role, // Assuming role is used for simplicity
//            role: role,
//            assignedProject: ""
//        )
//        
//        dbHandler.assignProject(employeeId: employee.id, project: project)
//    }
//    
//    func generateReport() {
//        let departments = ["HR", "Training", "IT and Software", "Accounts"]
//        
//        // Loop through each department
//        for department in departments {
//            let count = dbHandler.getEmployeeCountByDepartment(department: department)
//            
//            // Update the departmentCounts dictionary
//            departmentCounts[department] = count
//        }
//        
//        // Trigger navigation after data is fetched
//        navigateToReport = true
//    }
//}
//
//#Preview {
//    AdminViewLabTask()
//}


struct AdminViewLabTask: View {
    @State var search: String = ""
    @State var id: String = ""
    @State var name: String = ""
    @State var role: String = ""
    @State var project: String = ""
    @State var departmentCounts: [String: Int] = [:]
    @State var selectedOption: String = "Save"
    @State var options: [String] = ["Save", "Update", "Delete"]
    var dbHandler = DBHandler()

    @State var navigateToReport = false

    var body: some View {
        VStack {
            // Search Section
            HStack {
                TextField("Search here", text: $search)
                    .padding(.leading, 10)
                    .frame(height: 35)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(5)
                    .overlay(
                        HStack {
                            Spacer()
                            Button(action: {
                                performSearch()
                            }) {
                                Image(systemName: "magnifyingglass.circle")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 10)
                            }
                        }
                    )
                    .shadow(radius: 5)
                    .padding()
            }

            // Input Fields
            Group {
                HStack {
                    Text("Emp ID")
                    TextField("", text: $id)
                        .frame(height: 35)
                        .background(.white)
                        .border(.gray, width: 1)
                        .cornerRadius(5)
                        .shadow(radius: 5)
                        .padding()
                }

                HStack {
                    Text("Emp Name")
                    TextField("", text: $name)
                        .frame(height: 35)
                        .background(.white)
                        .border(.gray, width: 1)
                        .cornerRadius(5)
                        .shadow(radius: 5)
                        .padding()
                }

                HStack {
                    Text("Role")
                    TextField("", text: $role)
                        .frame(height: 35)
                        .background(.white)
                        .border(.gray, width: 1)
                        .cornerRadius(5)
                        .shadow(radius: 5)
                        .padding()
                }

                HStack {
                    Text("Project")
                    TextField("", text: $project)
                        .frame(height: 35)
                        .background(.white)
                        .border(.gray, width: 1)
                        .cornerRadius(5)
                        .shadow(radius: 5)
                        .padding()
                }
            }
            
            DropDown(options: options, selectedOption: $selectedOption)
            
            // Buttons Section
            HStack {
                Button(action: {
                    if selectedOption == "Save" {
                        saveEmployee()
                    }
                    if selectedOption == "Update" {
                        updateEmployee()
                    }
                    if selectedOption == "Delete" {
                        deleteEmployee()
                    }
                }) {
                    Text("Apply")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 35)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                Button(action: {
                    generateReport()
                }) {
                    Text("Generate Report")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 35)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()

            // Navigation to EmployeeCountView
            NavigationLink(
                destination: EmployeeCountView(departmentCounts: departmentCounts),
                isActive: $navigateToReport
            ) {
                EmptyView()
            }
        }
        .padding()
    }

    // MARK: - Helper Functions

    func performSearch() {
        guard !search.isEmpty else { return }
        let employee = dbHandler.getEmployeeById(employeeId: Int(search)!)
        if let employee = employee {
            id = "\(employee.id)"
            name = employee.employeeName
            role = employee.role
            project = employee.assignedProject
        }
    }

    func saveEmployee() {
        guard let employeeId = Int(id), !name.isEmpty, !role.isEmpty, !project.isEmpty else {
            print("All fields are required.")
            return
        }

        let employee = Employee(
            id: employeeId,
            employeeName: name,
            department: role, // Assuming role is used for simplicity
            role: role,
            assignedProject: project
        )
        dbHandler.saveEmployee(employee: employee)
        dbHandler.assignProject(employeeId: employee.id, project: project)
    }

    func updateEmployee() {
        guard let employeeId = Int(id), !name.isEmpty, !role.isEmpty else {
            print("All fields are required.")
            return
        }

        dbHandler.updateEmployee(
            employeeId: employeeId,
            newName: name,
            newDepartment: role,
            newRole: role,
            newAssignedProject: project
        )
    }

    func deleteEmployee() {
        guard let employeeId = Int(id), !id.isEmpty else {
            print("Employee ID is required.")
            return
        }

        dbHandler.deleteEmployee(employeeId: employeeId)
    }

    func generateReport() {
        let departments = ["HR", "Training", "IT and Software", "Accounts"]

        // Loop through each department
        for department in departments {
            let count = dbHandler.getEmployeeCountByDepartment(department: department)

            // Update the departmentCounts dictionary
            departmentCounts[department] = count
        }

        // Trigger navigation after data is fetched
        navigateToReport = true
    }
}

#Preview {
    AdminViewLabTask()
}
