//
//  Customer_MamLab9.swift
//  firstApp
//
//  Created by apple on 16/12/2024.
//

import SwiftUI

struct Customer_MamLab9: View {
    @State var cid: String = ""
    @State var bill: String = ""
    @State var selectedOrder = "Select Order"
    var orderOptions: [String] = ["Cakes","Fruits", "Tea"]
    
    @State private var navigateToList = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Text("Customer ID")
                TextField("", text: $cid)
                    .padding(.all, 5)
                    .background(.white)
                    .border(.gray,width: 1)
                    .cornerRadius(10).padding()
                DropDown(options: orderOptions, selectedOption: $selectedOrder)
                Text("Bill")
                TextField("", text: $bill)
                    .padding(.all, 5)
                    .background(.white)
                    .border(.gray,width: 1)
                    .cornerRadius(10).padding()
                HStack{
                    Button(action:{
                        let manager = DBCustomer()
                        manager.saveCustomer(id: Int(cid)!, order: selectedOrder, bill: Int(bill) ?? 0)
                        navigateToList = true
                        print(navigateToList)
                    }, label:{
                        Text("Save")
                            .frame(maxWidth: .infinity)
                            .frame(height: 35)
                            .background(.yellow)
                            .cornerRadius(10)
                            .foregroundStyle(.black).padding()
                    })
                    
                    Button(action:{
                        let manager = DBCustomer()
                        manager.editCustomer(id: Int(cid)!, newOrder: selectedOrder, newBill: Int(bill)!)
                        navigateToList = true
                    }, label:{
                        Text("Update")
                            .frame(maxWidth: .infinity)
                            .frame(height: 35)
                            .background(.yellow)
                            .cornerRadius(10)
                            .foregroundStyle(.black).padding()
                    })
                }
                
                
                NavigationLink(
                    destination: CustomerListView(cData: [Customer]()),
                    isActive: $navigateToList
                ) {
                    EmptyView()
                }
                .hidden()
                
            }
        }
    }
}

struct CustomerListView: View {
    
    @State var cid: Int = 0
    @State var bill: Int = 0
    @State var selectedOrder = "Select Order"
    
    @State var cData = [Customer]()
    
    @State private var navigateToEdit = false
    
    var body: some View {
        VStack(alignment: .leading){
            List(cData){c in
                HStack{
                    Text("\(c.id)")
                    Text("\(c.order)")
                    Text("\(c.bill)")
                    Button(action:{
                        let manager = DBCustomer()
                        manager.deleteCustomer(id: c.id)
                    }, label:{
                        Text("del")
                            .frame(maxWidth: .infinity)
                            .frame(height: 35)
                            .background(.yellow)
                            .cornerRadius(10)
                            .foregroundStyle(.black).padding()
                    })
                    Button(action:{
                        cid = c.id
                        bill = c.bill
                        selectedOrder = c.order
                        navigateToEdit = true
                    }, label:{
                        Text("Edit")
                            .frame(maxWidth: .infinity)
                            .frame(height: 35)
                            .background(.yellow)
                            .cornerRadius(10)
                            .foregroundStyle(.black).padding()
                    })
                    
                    NavigationLink(
                        destination: Customer_MamLab9(cid: String(cid), bill: String(bill), selectedOrder: selectedOrder),
                        isActive: $navigateToEdit
                    ) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
        }.onAppear(){
            let manager = DBCustomer()
            cData = manager.getAllCustomer()
        }
    }
}

#Preview {
    Customer_MamLab9()
}
