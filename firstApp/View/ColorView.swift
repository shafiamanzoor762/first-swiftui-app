//
//  ColorView.swift
//  firstApp
//
//  Created by apple on 11/11/2024.
//

import SwiftUI

struct ColorView: View {
    @State var color: String
    @State var IsShow: Bool
    
    @State var colors = [String]()
    
    var body: some View {
        VStack{
            
                TextField("  Color", text: $color)
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(.white)
                    .border(.gray, width: 1)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                Button(action:{
                    colors.append(color)
                    IsShow = false
                },label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .frame(height: 35)
                        .background(.yellow)
                        .cornerRadius(10)
                        .foregroundStyle(.black).padding()
                })
                Button(action:{
                    IsShow = true
                },label: {
                    Text("Show")
                        .frame(maxWidth: .infinity)
                        .frame(height: 35)
                        .background(.yellow)
                        .cornerRadius(10)
                        .foregroundStyle(.black).padding()
                })
                if IsShow {
                    List{
                        ForEach(colors, id: \.self){c in
                            Text("Name: \(c)")
                        }
                    }.frame(height:200)
                }
            }.padding()
    }
}
#Preview {
    ColorView(color: "black", IsShow: false, colors: [String]())
}
