//
//  EmployeeLabTaskView.swift
//  firstApp
//
//  Created by apple on 18/11/2024.
//

import SwiftUI

struct EmployeeLabTaskView: View {
    @State var Id: String
    @State var Name: String
    @State var selectedDesignation = "Select Destination"
    var desigOptions: [String] = ["Developer","Manager", "Tester"]
    @State var emp:[String]
    
    var body: some View {
        
        VStack {
            TextField("  ID", text: $Id)
                .frame(maxWidth: .infinity)
                .frame(height: 35)
                .background(.white)
                .border(.gray, width: 1)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            TextField("  Name", text: $Name)
                .frame(maxWidth: .infinity)
                .frame(height: 35)
                .background(.white)
                .border(.gray, width: 1)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            DropDown(options: desigOptions, selectedOption: $selectedDesignation)
            
            Button(action:{
                emp.append("\(Id)\n\(Name)\n\(selectedDesignation)")
            }, label:{
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(.yellow)
                    .cornerRadius(10)
                    .foregroundStyle(.black).padding()
            })
            
            List(emp, id: \.self){e in
                Text("\(e)")
            }.frame(height: 400)
            
            //                List{
            //                    ForEach(emp, id: \.self){e in
            //                        Text("\(e)")
            //                    }
            //                }.frame(height: 400)
        }.padding().ignoresSafeArea()
        
    }
}


#Preview {
    EmployeeLabTaskView(Id: "", Name: "", selectedDesignation: "Select Destination", emp: [String]())
}
