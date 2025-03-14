
import SwiftUI

struct EmployeesView: View {
    @State var id: String = ""
    @State var employeeName: String = ""
    @State var dpt = ["HR", "Training", "IT and Software", "Accounts"]
    @State var role = ["Manager", "Trainer", "Worker"]
    @State var dptSelectedText: String = ""
    @State var roleSelectedText: String = ""
    
    @State private var navigateToDetails = false
    @State private var selectedEmployee: Employee? = nil
    
    // Initialize the DBHandler
    var dbHandler = DBHandler()

    var body: some View {
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
                // Ensure the ID and Name fields are not empty before saving
                if let employeeId = Int(id), !employeeName.isEmpty, !dptSelectedText.isEmpty, !roleSelectedText.isEmpty {
                    let employee = Employee(
                        id: Int(id) ?? 0,
                        employeeName: employeeName,
                        department: dptSelectedText,
                        role: roleSelectedText,
                        assignedProject: ""
                    )
                    
                    // Save the employee
                    let result = dbHandler.saveEmployee(employee: employee)
                    print(result)
//                    if result == "Employee saved successfully!" {
//                        if let fetchedEmployee = dbHandler.getEmployeeById(employeeId: employeeId) {
//                            selectedEmployee = fetchedEmployee
//                            navigateToDetails = true
//                        } else {
//                            print("Failed to fetch employee details after saving.")
//                        }
//                    } else {
//                        print("Failed to save employee.")
//                    }
                    
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

        }
        .padding()
    }
}
