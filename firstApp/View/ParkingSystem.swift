//
//  CarParkingSystem.swift
//  firstApp
//
//  Created by apple on 29/11/2024.
//

import SwiftUI


struct ParkingSystem: View {

    @State var vp = [VehicleParkingSystem]()
    @State var searchText: String = ""
    @State var vhNumber: String = ""
    @State var type: String = "Bike"
    @State var vpout : VehicleParkingSystem

    var filteredvp : [VehicleParkingSystem] {
        return vp.filter({r in
            (searchText == "All" || r.type == searchText) && (r.parkIn)})
    }
    var filteredParkOut : [VehicleParkingSystem]{
        return vp.filter({r in
            (!r.parkIn)})
    }
    var body: some View {
        VStack(alignment: .leading){
            TextField("Vehicle Number", text: $vhNumber)
            HStack{
                RadioButton(selectedText:$type,text: "Car", foregroundColor: Color.blue)
                RadioButton(selectedText: $type,text: "Bike", foregroundColor: Color.blue)
                Spacer()
                Button(action:{
                    vp.append(VehicleParkingSystem(number: vhNumber, type: type, parkIn: true))
                }, label: {
                    Text("Park in").frame(width: 100, height: 50).background(Color.yellow).foregroundStyle(.purple).shadow(radius: 2).cornerRadius(20)
                })
            }
            HStack(alignment: .center){
                Button(action:{
                    searchText = "All"
                }, label: {
                    Text("All").frame(width: 100, height: 50).background(Color.yellow).foregroundStyle(.purple).shadow(radius: 2).cornerRadius(20)
                })
                Button(action:{
                    searchText = "Car"
                }, label: {
                    Text("Car").frame(width: 100, height: 50).background(Color.yellow).foregroundStyle(.purple).shadow(radius: 2).cornerRadius(20)
                })
                Button(action:{
                    searchText = "Bike"
                }, label: {
                    Text("Bike").frame(width: 100, height: 50).background(Color.yellow).foregroundStyle(.purple).shadow(radius: 2).cornerRadius(20)
                })
                Button(action:{
                    searchText = "Parked Out"
                }, label: {
                    Text("Parked Out").frame(width: 100, height: 50).background(Color.yellow).foregroundStyle(.purple).shadow(radius: 2).cornerRadius(20)
                })
            }
            HStack{
                Text("Total parked in:\(filteredvp.count)")
                Spacer()
                Text("Total Earnings: Rs \(0)")
            }
     
            List{
         
                ForEach(searchText == "Parked Out" ? filteredParkOut: filteredvp, id: \.number) {v in
                    VStack(alignment: .leading) {
                        HStack{
                            VStack{
                                Text("\(v.number)")
                                    .font(.headline)
                                Text("\(v.type)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            if(v.parkIn){
                                Button(action:{
                                    
                                    if let index = vp.firstIndex(where: { $0.number == v.number }) {
                                        vp[index].parkIn = false
                                    }
                                    
                                }, label: {
                                    Text("Park Out").frame(width: 100, height: 50).background(Color.yellow).foregroundStyle(.purple).shadow(radius: 2).cornerRadius(20)
                                })
                            }
                        }
                    }
                }
            }.padding().frame(height:400)
        }
    }
}

#Preview {
    ParkingSystem(vpout: VehicleParkingSystem(number: "", type: "", parkIn: true))
}
