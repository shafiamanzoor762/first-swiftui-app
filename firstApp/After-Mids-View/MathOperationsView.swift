//
//  MathOperationsView.swift
//  firstApp
//
//  Created by apple on 27/12/2024.
//

import SwiftUI

struct MathOperationsView: View {
    @State var n1 = ""
    @State var n2 = ""
    
    @State var res : String = ""
    var body: some View {
        VStack{
            TextField("First No", text: $n1)
                .padding(.all, 5)
                .background(.white)
                .border(.gray,width: 1)
                .cornerRadius(10).padding()
            
            TextField("Second No", text: $n2)
                .padding(.all, 5)
                .background(.white)
                .border(.gray,width: 1)
                .cornerRadius(10).padding()
            
            Text(res)
            
            Button(action:{
//                let api = APIWrapper()//create an object
//                let response = api.getMethodCall(controllerName: "Math", actionName: "Sum?n1=\(n1)&n2=\(n2)")
//                if response.ResponseCode == 200{
//                    print("Success \(response.ResponseMessage)")
//                    res = response.ResponseMessage
//                }
//                else{
//                    print("Error \(response.ResponseMessage)")
//                }
            }, label:{
                Text("+")
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(.yellow)
                    .cornerRadius(10)
                    .foregroundStyle(.black).padding()
            })
            
            Button(action:{
//                let api = APIWrapper()//create an object
//                let response = api.getMethodCall(controllerName: "Math", actionName: "Subtract?n1=\(n1)&n2=\(n2)")
//                if response.ResponseCode == 200{
//                    print("Success \(response.ResponseMessage)")
//                    res = response.ResponseMessage
//                }
//                else{
//                    print("Error \(response.ResponseMessage)")
//                }
            }, label:{
                Text("-")
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(.yellow)
                    .cornerRadius(10)
                    .foregroundStyle(.black).padding()
            })
            
            Button(action:{
//                let api = APIWrapper()//create an object
//                let response = api.getMethodCall(controllerName: "Math", actionName: "Multiply?n1=\(n1)&n2=\(n2)")
//                if response.ResponseCode == 200{
//                    print("Success \(response.ResponseMessage)")
//                    res = response.ResponseMessage
//                }
//                else{
//                    print("Error \(response.ResponseMessage)")
//                }
            }, label:{
                Text("x")
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(.yellow)
                    .cornerRadius(10)
                    .foregroundStyle(.black).padding()
            })
            
            Button(action:{
//                let api = APIWrapper()//create an object
//                let response = api.getMethodCall(controllerName: "Math", actionName: "Divide?n1=\(n1)&n2=\(n2)")
//                if response.ResponseCode == 200{
//                    print("Success \(response.ResponseMessage)")
//                    res = response.ResponseMessage
//                }
//                else{
//                    print("Error \(response.ResponseMessage)")
//                }
            }, label:{
                Text("/")
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(.yellow)
                    .cornerRadius(10)
                    .foregroundStyle(.black).padding()
            })
        }
    }
}

#Preview {
    MathOperationsView()
}
