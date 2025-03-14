//
//  ShowAllContactsView1.swift
//  firstApp
//
//  Created by apple on 15/01/2025.
//

import SwiftUI

struct ShowAllContactsView1: View {
    @State private var contactImage: UIImage? = nil
    @State private var isImagePickerPresented: Bool = false
    @State private var contacts = [Contact]()
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                
                List{
                    ForEach(contacts, id:\.self.id){
                        con in
                        VStack(alignment:.leading){
                            Text("Id: \(con.id)")
                            Text("Name: \(con.name!)")
                            Text("Email: \(con.email!)")
                            if let contact = con.contact1{
                                Text("Contact: \(contact)")
                            }
                            AsyncImage(url: URL(string: "\(APIHelper.baseImageURLString)\(con.image)")){
                                phase in
                                if let image = phase.image{
                                    image.resizable().scaledToFit().frame(height:50)
                                }else{
                                    ProgressView().frame(height:50)
                                }
                            }
                        }
                    }.onDelete(perform: {
                        x in
                        contacts.remove(atOffsets: x)
                    })
                    .onMove(perform: {
                        x, y in
                        contacts.move(fromOffsets: x, toOffset: y)
                    })
                }
            }
            .navigationTitle("Add Contact")
            .toolbar(){
                //EditButton()
            }.sheet(isPresented: $isImagePickerPresented){
                CustomImagePicker(contactImage: $contactImage)
            }
            .onAppear(){
                //                let api = APIWrapper()
                //                let response = api.getMethodCall(controllerName: "Contacts", actionName: "AllContacts")
                //                if response.ResponseCode == 200{
                //                    if let data = response.ResponseData{
                //                        contacts = try! JSONDecoder().decode([Contact].self, from: data)
                //                    }
                //                }
                let api = APIHelper()
                api.getMethodCall(controllerName: "Contacts", actionName: "AllContacts", completion: {
                    
                    response in
                    if response.responseCode == 200{
                        if let data = response.responseData{
                            contacts = try! JSONDecoder().decode([Contact].self, from: data)
                        }
                    }
                    
                })
            }
        }
    }
}
#Preview {
    ShowAllContactsView1()
}
