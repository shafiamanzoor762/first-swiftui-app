//
//  LabTaskView.swift
//  firstApp
//
//  Created by apple on 15/11/2024.
//

import SwiftUI

struct LabTaskView: View {
    var sourceOptions = ["LHR", "RWP", "ISB"]
    @State var selectedOption1 = "Select Source"
    @State var selectedOption2 = "Select Destination"
    @State var depTime : String
    @State var data = [String]()
    @State var routes : [Route] = [Route]()
    @State var searchText = ""
    @State var filteredRoutes : [Route]
    @State var message = ""
    @State var isMatch = ""
    @State var isAlertShown = false
    
    var body: some View {
        VStack(alignment: .leading){
            
            TextField("Time", text: $searchText).background(Color.gray)
                .opacity(0.2).cornerRadius(20)
            
            Button(action:{
                
                filteredRoutes = routes.filter({r in r.destination.contains(searchText) || r.source.contains(searchText)})
                
            }, label:{
                Text("Show")
            })
            
            Text("Source")
            DropDown(options: sourceOptions, selectedOption: $selectedOption1)
            Spacer()
            Text("Destination")
            DropDown(options: sourceOptions, selectedOption: $selectedOption2)
            Spacer()
            Text("Departure Time")
            TextField("Time", text: $depTime).background(Color.gray)
                .opacity(0.2).cornerRadius(20)
            Button(action:{
                routes.append(Route(source: selectedOption1, destination: selectedOption2, time: depTime))
            }, label:{
                Text("Add")
            })
            List{
                if (searchText.isEmpty){
                    ForEach(routes, id: \.self.destination){route in
                        VStack(alignment:.leading){
                            Text("Source: \(route.source)")
                            Text("Destination: \(route.destination)")
                            Text("Time: \(route.time)")
                        }.padding()
                        
                    }
                }else{
                ForEach(filteredRoutes, id: \.self.destination){route in
                    VStack(alignment:.leading){
                        Text("Source: \(route.source)")
                        Text("Destination: \(route.destination)")
                        Text("Time: \(route.time)")
                    }.padding()
                        .onTapGesture {
                            isAlertShown = true
                            message = "Source: \(selectedOption1)\n Destination: \(selectedOption2)\n Time: \(depTime)"
                        }
                        .alert(isPresented: $isAlertShown,
                               content: {
                            Alert(title: Text("Alert"), message: Text(message),
                                  dismissButton: .default(Text("Ok")))
                        })
                }
            }
            }.frame(height: 400)
        }
    }
}

#Preview {
    LabTaskView(depTime: "", routes: [Route](), filteredRoutes: [Route]())
}
