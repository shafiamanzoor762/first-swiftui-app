//
//  Save_Store_User.swift
//  firstApp
//
//  Created by apple on 17/01/2025.
//




import SwiftUI
struct UserCredentials : Codable{
    var name: String
    var password: String
}
struct Save_Store_User: View {
    
    @State var name: String = ""
    @State var password: String = ""
    @State var user = [UserCredentials]()
    @State var users = [UserCredentials]()
    let mDefault = UserDefaults.standard
    var body: some View {
        ZStack(alignment:.leading){
            Color.purple
                
            VStack(alignment:.leading){
                Text("User name").foregroundStyle(.white)
                HStack{
                    Image(systemName: "person")
                        .foregroundStyle(.purple)
                        .padding()
                    TextField("", text:$name)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 35)
                .background(.white)
                .border(.gray, width: 1)
                .cornerRadius(10)
                .shadow(radius: 5)
                Text("Password").foregroundStyle(.white)
                HStack{
                    Image(systemName: "lock")
                        .foregroundStyle(.purple)
                        .padding()
                    SecureField("", text:$password)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 35)
                .background(.white)
                .border(.gray, width: 1)
                .cornerRadius(10)
                .shadow(radius: 5)
                HStack{
                    Button(action:{
                        mDefault.set(name, forKey: "key1")
                        mDefault.set(password, forKey: "key2")
                        user.append(UserCredentials(name: name, password: password))
                        let jsonData = try! JSONEncoder().encode(user)
                        if let jsonString = String(data: jsonData, encoding: .utf8){
                            mDefault.set(jsonString, forKey: "object")
                            print(jsonString)
                        }
                    }, label: {
                        Text("Store")
                            .frame(maxWidth: .infinity)
                            .frame(height:35)
                            .background(.yellow)
                            .foregroundStyle(.black)
                            .cornerRadius(10)
                    }).padding(.top, 10)
                    Button(action:{
                        if let uName = mDefault.string(forKey: "key1"){
                            name = uName
                        }else{
                            name = "No Data"
                        }
                        if let uPassword = mDefault.string(forKey: "key1"){
                            password = uPassword
                        }
                        else{
                            password = "No Data"
                        }
                        
                        if let jsonString = mDefault.string(forKey: "object"){
                            if let data = jsonString.data(using: .utf8){
                                let user2 = try! JSONDecoder().decode([UserCredentials].self, from: data)
                                users = user2
                            }
                        }
                    }, label: {
                        Text("Retrieve")
                            .frame(maxWidth: .infinity)
                            .frame(height:35)
                            .background(.yellow)
                            .foregroundStyle(.black)
                            .cornerRadius(10)
                    }).padding(.top, 10)
                }
                
                .padding()
                
                List{
                    ForEach(users, id:\.self.name){
                        u in
                        VStack(alignment:.leading){
                            Text("Name: \(u.name)")
                            Text("Email: \(u.password)")
                        }
                    }.onDelete(perform: {
                        x in
                        user.remove(atOffsets: x)
                        let jsonData = try! JSONEncoder().encode(user)
                        if let jsonString = String(data: jsonData, encoding: .utf8){
                            mDefault.set(jsonString, forKey: "object")
                            print(jsonString)
                        }
                    })
                    .onMove(perform: {
                        x, y in
                        user.move(fromOffsets: x, toOffset: y)
                    })
                }.frame(height: 350)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    Save_Store_User()
}
