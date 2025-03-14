//
//  FuelEfficiencyCalculator.swift
//  firstApp
//
//  Created by apple on 25/10/2024.
//

import SwiftUI

struct FuelEfficiencyCalculator: View {
    @State var distance: String = ""
    @State var fuel: String = ""
    
    @State var fuelEff: Float = 0
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Distance Traveled (km)")
            /// Binding variable $text
            TextField("  like 100 e.t.c", text: $distance)
                .frame(width: 300, height:  35)
                .border(.gray, width: 1)
            
            Text("Fuel Used (liters)")
            TextField("", text: $fuel)
                .frame(width: 300, height:  35)
                .border(.gray, width: 1)
            
            Button(action:{
                fuelEff = Float(distance)! /  Float(fuel)!
            }, label: {
                Text("Calculate")
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 30)
                    .background(.purple)
            })
            Text("Fuel Efficiency: \(fuelEff) km/l")
            
        }.padding(15)
    }
}

#Preview {
    FuelEfficiencyCalculator()
}
