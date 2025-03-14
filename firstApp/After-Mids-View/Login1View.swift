//
//  LoginView.swift
//  firstApp
//
//  Created by apple on 18/12/2024.
//


import SwiftUI

struct Login1View: View {
    
    @State var name: String = ""
    @State var password: String = ""
    @State var message: String = ""
    @State var isAlertShown: Bool = false
    var body: some View {
        ZStack(alignment:.leading){
            Color.purple
                
            VStack{
                Text("Login Screen")
                    .foregroundStyle(.white)
                    .bold()
                    .font(.largeTitle)
                Text("User name").foregroundStyle(.white)
                HStack{
                    Image(systemName: "person")
                        .foregroundStyle(.purple)
                        .padding()
                    TextField("", text:$name)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 35)
                .background(.white)
                .border(.gray, width: 1)
                .cornerRadius(10)
                .shadow(radius: 5)
                Text("Password").foregroundStyle(.white)
                HStack{
                    Image(systemName: "lock")
                        .foregroundStyle(.purple)
                        .padding()
                    SecureField("", text:$password)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 35)
                .background(.white)
                .border(.gray, width: 1)
                .cornerRadius(10)
                .shadow(radius: 5)
                
                Button(action:{
                    let db = DBUser()
                    let isPasswordCorrect = db.checkPassword(forUser: name, inputPassword: password)
                    if isPasswordCorrect {
                        message = "Login successful!"
                        isAlertShown = true
                    } else {
                        message = "Incorrect username or password."
                        isAlertShown = true
                    }
                }, label: {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .frame(height:35)
                        .background(.yellow)
                        .foregroundStyle(.black)
                        .cornerRadius(10)
                }).padding(.top, 10)
            }
            .padding()
        }.ignoresSafeArea()
            .alert(isPresented: $isAlertShown,
                    content: {
                Alert(title: Text("Alert"), message: Text(message),
                      dismissButton: .default(Text("Ok")))
            })
    }
}

#Preview {
    Login1View()
}
