//
//  SignUpView.swift
//  firstApp
//
//  Created by apple on 18/12/2024.
//

import SwiftUI

struct SignUp1View: View {
    
    @State var name: String = ""
    @State var password: String = ""
    @State private var navigateToLogin = false // Tracks navigation state

    var body: some View {
        NavigationStack {
            ZStack {
                Color.purple
                
                VStack(alignment: .leading) {
                    // Username Field
                    Text("User name").foregroundStyle(.white)
                    HStack {
                        Image(systemName: "person")
                            .foregroundStyle(.purple)
                            .padding()
                        TextField("", text: $name)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(.white)
                    .border(.gray, width: 1)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    
                    // Password Field
                    Text("Password").foregroundStyle(.white)
                    HStack {
                        Image(systemName: "lock")
                            .foregroundStyle(.purple)
                            .padding()
                        SecureField("", text: $password)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(.white)
                    .border(.gray, width: 1)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    
                    // SignUp Button
                    Button(action: {
                        let db = DBUser()
                        db.saveUser(id: Int.random(in: 0..<100), name: name, password: password)
                        navigateToLogin = true // Trigger navigation
                    }, label: {
                        Text("SignUp")
                            .frame(maxWidth: .infinity)
                            .frame(height: 35)
                            .background(.yellow)
                            .foregroundStyle(.black)
                            .cornerRadius(10)
                    })
                    .padding(.top, 10)
                }
                .navigationTitle("Signup")
                .padding()
                
                // Navigation triggered by state
                NavigationLink(
                    destination: Login1View(),
                    isActive: $navigateToLogin
                ) {
                    EmptyView()
                }
                .hidden()
            }
            .ignoresSafeArea()
        }
    }
}


#Preview {
    SignUp1View()
}
