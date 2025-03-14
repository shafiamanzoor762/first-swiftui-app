//
//  DropDown.swift
//  firstApp
//
//  Created by apple on 13/11/2024.
//

import SwiftUI

struct DropDown: View {
    var options : [String]
    @Binding var selectedOption : String
    @State var isDropdownShown = false
    
    //var items = [String]()
    var body: some View {
        VStack{
            VStack{
                Button(action:{
                    isDropdownShown.toggle()
                }, label:{
                    HStack{
                        Text(selectedOption).padding()
                        Spacer()
                        Image(systemName: isDropdownShown ? "chevron.up": "chevron.down")
                    }.frame(maxWidth: .infinity, maxHeight: 40)
                        .border(Color.gray, width: 2)
                        .cornerRadius(5)
                        //.padding()
                })
//                .overlay(VStack{
//
//                },alignment: .topLeading)
                
                if(isDropdownShown){
                    VStack{
                        ForEach(options,id:\.self){
                            opt in
                            
                            Button(action:{
                                isDropdownShown = false
                                selectedOption = opt
                            }, label:{
                                HStack{
                                    Text(opt)
                                    Spacer()
                                    Image(systemName: selectedOption == opt ? "checkmark.square": " ")
                                }
                                .frame(maxWidth: .infinity, maxHeight: 40)
                                //.border(.gray, width: 1)
                                //.border(Color.gray, width: 2)
                                //.cornerRadius(5)
                                .padding()
                            })
                        }
                    }.background(.white)
                        .border(.gray, width: 1)
                    .offset(y: 45)
                    .padding()
                        
                    
                }
                
            }
        }.ignoresSafeArea()
    }
}

//#Preview {
//    DropDown(options: ["A", "B", "C"], selectedOption: )
//}
