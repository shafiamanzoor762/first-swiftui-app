//
//  DiscountViewModel.swift
//  firstApp
//
//  Created by apple on 01/11/2024.
//

import Foundation

class DiscountViewModel: ObservableObject{
    @Published var discOption: String = "Admin"
    @Published var purchaseAmt: String = ""
    
    @Published var billAmount:String = ""
    func calculateDiscount(){
        var discountPercentage = 0
        if discOption == "Member"{
            discountPercentage = 10
        }else{
            discountPercentage = 5
        }
        let amount = Int(purchaseAmt)!
        let discAmount = amount * discountPercentage / 100
        let totalBill = amount - discAmount
        billAmount = "\(totalBill)"
    }
}
