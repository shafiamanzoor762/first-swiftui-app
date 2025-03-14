
import SwiftUI

struct AdminViewAPI: View {
    @State var search: String = ""
    @State var id: String = ""
    @State var name: String = ""
    @State var role: String = ""
    @State var project: String = ""
    @State var departmentCounts: [String: Int] = [:]
    @State var navigateToReport = false  // State to trigger navigation
    
    @State private var emp = Employeee()
    var body: some View {
        NavigationView {
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
                                    let api = APIHelper()
                                    let response = api.getMethodCall(controllerName: "Contacts", actionName: "GetEmployeeById?id=\(search)", completion: {response in
                                        if response.responseCode == 200{
                                            print("fetch")
                                            if let data = response.responseData{
                                                emp = try! JSONDecoder().decode(Employeee.self, from: data)
                                            }
                                        }else{
                                            print("Error-> \(response.responseMessage)")
                                        }
                                    })
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
                
                // Buttons Section
                HStack {
                    Button(action: {
                        //UpdateEmployee
                        let api = APIHelper()
                        // Ensure the ID and Name fields are not empty before saving
                        if let employeeId = Int(id), !name.isEmpty, !project.isEmpty, !role.isEmpty {
                            let employee = Employeee(
                                id: Int(id) ?? 0,
                                empName: name,
                                role: role,
                                assignedProject: project
                            )
                            
                            let jsonData = try! JSONEncoder().encode(employee)
                            let response = api.postMethodCall(controllerName: "Contacts", actionName: "UpdateEmployee", httpBody: jsonData, completion: {
                                response in
                                if response.responseCode == 200{
                                    print("Saved")
                                }else{
                                    print("Error-> \(response.responseMessage)")
                                }
                            })
                        } else {
                            print("Please fill in all fields.")
                        }
                    }) {
                        Text("Save")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200, height: 35)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        navigateToReport = true
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
    }
    
   
}
