//
//  ContactListView.swift
//  firstApp
//
//  Created by apple on 01/01/2025.
//

import SwiftUI
struct ContactListView: View {
    @State var contactsLst = [Contact]()
    var body: some View {
        VStack{
            List(contactsLst, id: \.id){c in
                HStack {
                    VStack(alignment: .leading) {
                        Text(c.name ?? "No Name")
                            .font(.headline)
                        Text(c.email ?? "No Email")
                            .font(.subheadline)
                        Text(c.contact1 ?? "No Contact")
                            .font(.subheadline)
                        Text(c.image ?? "No Image")
                            .font(.subheadline)
                    }
                }
            }
            Button(action:{
              
            },label: {
                Text("Hello, World!")
            })
            
        }.onAppear(){
//            let api = APIWrapper()
//            let response = api.getMethodCall(controllerName: "Contacts", actionName: "allcontacts")
//            if response.ResponseCode == 200{
//                if let data = response.ResponseData{
//                    let contacts =  try! JSONDecoder().decode([Contact].self, from: data)
//                print(contacts)
//                    contactsLst = contacts
//                }
//            }else{
//                print(response.ResponseMessage)
//            }
        }
    }
}

#Preview {
    ContactListView()
}
