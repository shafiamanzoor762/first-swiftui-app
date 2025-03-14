//
//  AddContactView.swift
//  firstApp
//
//  Created by apple on 02/01/2025.
//

import SwiftUI
import simd

struct AddContactView1: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var contactImage: UIImage? = nil
    @State private var isImagePickerPresented: Bool = false
    @State private var inputImage: UIImage? = nil
    
    
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
                
                //NavigationLink("Text", destination: Login1View())
                
                Button(action: {
                    let contact = Contact(id: 0,name: name, contact1: phoneNumber, image: nil)
                    let contactData = try! JSONEncoder().encode(contact)
                    let jsonString = String(data:contactData, encoding: .utf8)
                    
                    var params = [String:String]()
                    params["contact"] = jsonString!
                    
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
                
                
            }.navigationTitle("Add Contact")
                .toolbar(){
                    //EditButton()
                }.sheet(isPresented: $isImagePickerPresented){
                    CustomImagePicker(contactImage: $contactImage)
                }
        }
    }
}
