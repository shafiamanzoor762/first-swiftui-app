//
//  LoginView.swift
//  firstApp
//
//  Created by apple on 30/10/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var adminState: Bool = true
    @State var memberState: Bool = false
    @State var selectedText: String = "Admin"
    
    var body: some View {
        ZStack{
            Color.purple
                
            VStack{
                Text("Login Screen")
                    .foregroundStyle(.white)
                    .bold()
                    .font(.largeTitle)
                HStack{
                    Image(systemName: "person")
                        .foregroundStyle(.purple)
                        .padding()
                    TextField("", text:$email)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 35)
                .background(.white)
                .border(.gray, width: 1)
                .cornerRadius(10)
                .shadow(radius: 5)
                
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
                
                Text("Role")
                RadioButton(selectedText: $selectedText, text: "Admin", foregroundColor: .white)
                RadioButton(selectedText: $selectedText, text: "User", foregroundColor: .white)
                
                CheckBox(state:$adminState, text: "Admin", foregroundColor: .white)
                CheckBox(state: $memberState, text: "Member", foregroundColor: .yellow)
                
                Button(action:{
                    print("Selceted text:\(selectedText)")
                    print("Admin state\(adminState)")
                    print("Member state\(memberState)")
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
            
            
//                        Image("BackgroundImage")
//                            .resizable()
//                            .scaledToFit()
//                            .blur(radius: 5)
//                            .ignoresSafeArea()
        }.ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
