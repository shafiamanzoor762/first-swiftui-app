//
//  EmployeeView.swift
//  firstApp
//
//  Created by apple on 08/11/2024.
//

import SwiftUI


struct EmployeeView: View {
    @StateObject var employeeViewModel = EmployeeViewModel()
    
    @State var empName = [EmployeeViewModel]()
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack{
                RadioButton(selectedText: $employeeViewModel.Option, text: "Add Employee View").padding()
                RadioButton(selectedText: $employeeViewModel.Option, text: "View Employee Count").padding()
            }
            if employeeViewModel.Option == "Add Employee View"{
                TextField("  ID", text: $employeeViewModel.Id)
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(.white)
                    .border(.gray, width: 1)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                
                TextField("  Name", text: $employeeViewModel.Name)
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(.white)
                    .border(.gray, width: 1)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                
                TextField("  Salary", text: $employeeViewModel.Salary)
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(.white)
                    .border(.gray, width: 1)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                
                
                Button(action:{
                    empName.append(employeeViewModel)
                    employeeViewModel.calculateTotal()
                }, label:{
                    Text("Add")
                        .frame(maxWidth: .infinity)
                        .frame(height: 35)
                        .background(.yellow)
                        .cornerRadius(10)
                        .foregroundStyle(.black).padding()
                })
                
            }else{
                List{
                    ForEach(empName, id: \.self.Id){emp in
                        Text("Name: \(emp.Name)")
                    }
                }.frame(height: 400)
                Text("Total Employee Added: \(employeeViewModel.EmpCount)")
            }
        }.padding().ignoresSafeArea()
    }
}

#Preview {
    EmployeeView( empName: [EmployeeViewModel]())
}
