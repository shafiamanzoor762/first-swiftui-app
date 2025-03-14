//
//  SignUpView.swift
//  firstApp
//
//  Created by apple on 15/11/2024.
//

import SwiftUI

struct SignUpView: View {
    var dropdownOptions = ["Admin", "Operator"]
    @State var selectedOption = "Select User Type"
    @State var isAlertShown = false
    var body: some View {
        VStack{
            DropDown(options: dropdownOptions, selectedOption: $selectedOption)
            
            Button(action:{
                print("Selected Option:\(selectedOption)")
                isAlertShown = true
            }, label:{
                Text("Show Selected Text")
            })
            
        }.alert(isPresented: $isAlertShown,
                content: {
            Alert(title: Text("Alert"), message: Text("Selected Option:\(selectedOption)"),
                  dismissButton: .default(Text("Ok")))
        })
        }
    
}

#Preview {
    SignUpView()
}
