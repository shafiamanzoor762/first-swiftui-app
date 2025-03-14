//
//  TipCalculatorView.swift
//  firstApp
//
//  Created by apple on 23/10/2024.
//

import SwiftUI

struct TipCalculatorView: View {
    @State var bill: String = ""
    @State var tip: String = ""
    
    @State var totalBill: Int = 0
    @State var tipAmt: Int = 0
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Total Bill")
            /// Binding variable $text
            TextField("  like 100 e.t.c", text: $bill)
                .frame(width: 300, height:  35)
                .border(.gray, width: 2)
            
            Text("Total Percentage")
            TextField("", text: $tip)
                .frame(width: 300, height:  35)
                .border(.gray, width: 2)
            
            Text("Tip Percentage")
            Button(action:{
                tipAmt = Int(bill)! *  Int(tip)! / 100
                totalBill = Int(bill)! + Int(tip)!
            }, label: {
                Text("Calculate")
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 30)
                    .background(.purple)
            })
            Text("Total Tip Amount:\(tipAmt)")
            Text("Bill After Tip:\(totalBill)")
            
        }.padding(15)
    }
}

#Preview {
    TipCalculatorView()
}
