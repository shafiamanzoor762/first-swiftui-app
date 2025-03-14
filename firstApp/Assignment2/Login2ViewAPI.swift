//
//  Login2ViewAPI.swift
//  firstApp
//
//  Created by apple on 20/01/2025.
//


import SwiftUI

struct Login2ViewAPI: View {
    
    @State var name: String = ""
    @State var password: String = ""
    
    @State var message: String = ""
    @State var isAlertShown: Bool = false
    @State var navigateToAdmin: Bool = false
    @State var navigateToEmployee: Bool = false
    
    @State var selectedCategory = "Select Category"
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
                        DropDown(options: desigOptions, selectedOption: $selectedCategory)
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
                        let api = APIHelper()
                        let user = Userrr(id: 0, name: name, password: password, category: selectedCategory)
                        let jsonData = try! JSONEncoder().encode(user)
                        let response = api.postMethodCall(controllerName: "Contacts", actionName: "AddUser", httpBody: jsonData, completion: {
                            response in
                            if response.responseCode == 200{
                                message = "Saved"
                            }else{
                                message = "Error-> \(response.responseMessage)"
                            }
                            isAlertShown = true
                        })
                        if selectedCategory == "Admin" {
                            navigateToAdmin = true
                        } else if selectedCategory == "Employee/User" {
                            navigateToEmployee = true
                        }
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
            .ignoresSafeArea()
            .alert(isPresented: $isAlertShown) {
                Alert(title: Text("Alert"), message: Text(message), dismissButton: .default(Text("Ok")))
            }
        }
    }
    

}


#Preview {
    Login2ViewAPI()
}
