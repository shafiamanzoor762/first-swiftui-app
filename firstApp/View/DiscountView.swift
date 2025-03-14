//
//  MemberView.swift
//  firstApp
//
//  Created by apple on 01/11/2024.
//

import SwiftUI

struct DiscountView: View {

    @StateObject var discountObj: DiscountViewModel
    
    var body: some View {
        ZStack{
            
            Color.purple
                .ignoresSafeArea()
            
            VStack{
                TextField("Purchase Amount", text: $discountObj.purchaseAmt)
                    .padding(.all, 5)
                    .background(.white)
                    .border(.gray,width: 1)
                    .cornerRadius(10).padding()
                
                RadioButton(selectedText: $discountObj.discOption,text:"Member", foregroundColor: .white)
                    .padding(.all,5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                RadioButton(selectedText: $discountObj.discOption,text:"Non-Member", foregroundColor: .white)
                    .padding(.all,5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button(action:{
                    discountObj.calculateDiscount()
                }, label:{
                    Text("Compute")
                        .frame(maxWidth: .infinity)
                        .frame(height: 35)
                        .background(.yellow)
                        .cornerRadius(10)
                        .foregroundStyle(.black).padding()
                })
                Text("Bill Amount \(discountObj.billAmount)")
            }
        }.onAppear(){
            
        }
    }
}

#Preview {
    DiscountView(discountObj: DiscountViewModel())
}
