//
//  AddContactView.swift
//  firstApp
//
//  Created by apple on 02/01/2025.


import SwiftUI
import simd

struct AddContactView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var contactImage: UIImage? = nil
    @State private var isImagePickerPresented: Bool = false
    @State private var inputImage: UIImage? = nil
    @State private var contacts = [Contact]()

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                TextField("Name", text: $name)
                
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Phone Number", text: $phoneNumber)
                    .keyboardType(.phonePad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                if let contactImage = contactImage {
                    Image(uiImage: contactImage)
                        .resizable()
                        .scaledToFit()
                    //                        .frame(height: 150)
                    //                        .clipShape(Circle())
                        .shadow(radius: 10)
                }
                Button(action: {
                    isImagePickerPresented = true
                }) {
                    HStack {
                        Image(systemName: "photo")
                            .font(.title)
                        Text("Select Image")
                    }
                }
                
                Button(action: {
                    
                    //                    let api = APIWrapper()
                    //                    let contact = Contact(id: 0, name: name, contact1: phoneNumber, email: email, image: nil)
                    //                    let jsonData = try! JSONEncoder().encode(contact)
                    //                    let response = api.postMethodCall(controllerName: "Contacts", actionName: "AddContact", httpBody: jsonData)
                    //                    if response.ResponseCode == 200{
                    //                        print("Saved")
                    //                    }else{
                    //                        print("Error-> \(response.ResponseMessage)")
                    //                    }
                    let contact = Contact(id: 0,name: name, contact1: phoneNumber, image: nil)
                    let contactData = try! JSONEncoder().encode(contact)
                    let jsonString = String(data:contactData, encoding: .utf8)
                    
                    var params = [String:String]()
                    params["contact"] = jsonString!
//                    params["name"]=name
//                    params["email"]=email
//                    params["phone"]=phoneNumber
                    
                    let api = APIHelper()
                    var images = [Media]()
                    images.append(Media(withImage: contactImage!, forKey: "image", imageName: "profile.jpg")!)
                    api.uploadImages(images: images, parameters: params, endPoint: "Contacts/UploadContact", completion: {
                        response in
                        if response.responseCode == 200{
                            print(response.responseMessage)
                        }else{
                            print(response.responseMessage)
                        }
                    })
                    
                }) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
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
                EditButton()
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

