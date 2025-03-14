//
//  ExpenseListView.swift
//  firstApp
//
//  Created by apple on 11/12/2024.
//

import SwiftUI

struct ExpenseListView: View {
    
    @State var expenseData = [Expense]()
    @State private var navigateToEdit = false
    
    var body: some View {
        NavigationView{
            List(expenseData){exp in
                
//                NavigationLink(destination: ExpenseView(expName:exp.name, expAmt: exp.amount, expDate: exp.date),label:{
//                    VStack(alignment: .leading){
//                        Text(exp.name)
//                        Text("\(exp.amount)")
//                        Text(exp.date)
//                    }
//                })
                HStack{
                    VStack(alignment: .leading){
                        Text(exp.name)
                        Text("\(exp.amount)")
                        Text(exp.date)
                    }
                    NavigationLink(
                        destination: ExpenseView(expName:exp.name, expAmt: exp.amount, expDate: exp.date),
                        isActive: $navigateToEdit
                    ) {
                        EmptyView()
                    }
                    .hidden()

                    Image(systemName: "pencil").onTapGesture {
                        navigateToEdit = true
                    }
                }
            }.onAppear(){
                let manager = DBManager()
                expenseData = manager.getAllExpenses()
            }
        }
    }
}

#Preview {
    ExpenseListView()
}
