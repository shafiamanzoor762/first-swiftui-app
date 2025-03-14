//
//  StudentAttandenceView.swift
//  firstApp
//
//  Created by apple on 29/01/2025.
//

import SwiftUI

struct StudentAttandenceView: View {
    //@State var
    @State var isPresent = "P"
    @State var col = Color.green
    var body: some View {
        VStack{
            Text("Attandance").font(.headline)
            List{
                HStack{
                    VStack(alignment: .leading){
                        Text("2021-arid-4450")
                        Text("Ali")
                    }.padding(.horizontal)
                    
                    Text("75")
                    Button(action:{
                        if isPresent == "P"{
                            isPresent = "A"
                            col = Color.red
                        }else{
                            isPresent = "P"
                            col = Color.green
                        }
                    }){
                        Text(isPresent)
                            .frame(width: 20,height: 10)
                            .padding()
                            .foregroundColor(.white)
                            .background(col)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

#Preview {
    StudentAttandenceView()
}
