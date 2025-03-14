//
//  LoginView.swift
//  firstApp
//
//  Created by apple on 03/01/2025.
//

import SwiftUI

struct Login2View: View {
    
    @State var name: String = ""
    @State var password: String = ""
    @State var message: String = ""
    @State var isAlertShown: Bool = false
    @State var navigateToAdmin: Bool = false
    @State var navigateToEmployee: Bool = false
    
    @State var selectedDesignation = "Select Category"
    var desigOptions: [String] = ["Admin", "Employee/User"]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                
                VStack(alignment: .leading) {
                    Text("Login Screen")
                        .foregroundStyle(.white)
                        .bold()
                        .font(.largeTitle)
                    
                    HStack {
                        Text("Category:").foregroundStyle(.white)
                        DropDown(options: desigOptions, selectedOption: $selectedDesignation)
                    }
                    
                    HStack {
                        Text("User name:").foregroundStyle(.white)
                        TextField("", text: $name)
                            .frame(maxWidth: .infinity)
                            .frame(height: 35)
                            .background(.white)
                            .border(.gray, width: 1)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    
                    HStack {
                        Text("Password:").foregroundStyle(.white)
                        SecureField("", text: $password)
                            .frame(maxWidth: .infinity)
                            .frame(height: 35)
                            .background(.white)
                            .border(.gray, width: 1)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    
                    Button(action: {
                        saveUser()
                    }, label: {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .frame(height: 35)
                            .background(.yellow)
                            .foregroundStyle(.black)
                            .cornerRadius(10)
                    })
                    .padding(.top, 10)
                    
                    NavigationLink(
                        destination: AdminView(),
                        isActive: $navigateToAdmin,
                        label: { EmptyView() }
                    )
                    
                    NavigationLink(
                        destination: EmployeesView(),
                        isActive: $navigateToEmployee,
                        label: { EmptyView() }
                    )
                }
                .padding()
            }
//            .ignoresSafeArea()
//            .alert(isPresented: $isAlertShown) {
//                Alert(title: Text("Alert"), message: Text(message), dismissButton: .default(Text("Ok")))
//            }
        }
    }
    
    func saveUser() {
        guard !name.isEmpty, !password.isEmpty else {
            message = "Please fill in all fields."
            isAlertShown = true
            return
        }
        
        if selectedDesignation == "Admin" || selectedDesignation == "Employee/User" {
            let db = DBHandler()
            let newUser = Userr(id: Int.random(in: 1...1000), name: name, password: password, category: selectedDesignation)
            db.saveUser(user: newUser)
            message = "User saved successfully!"
            isAlertShown = true
            
            if selectedDesignation == "Admin" {
                navigateToAdmin = true
            } else if selectedDesignation == "Employee/User" {
                navigateToEmployee = true
            }
        } else {
            message = "Please select a valid category."
            isAlertShown = true
        }
    }
}
