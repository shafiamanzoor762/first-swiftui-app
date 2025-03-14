//
//  DBUser.swift
//  firstApp
//
//  Created by apple on 18/12/2024.
//

import Foundation
import SQLite
class DBUser{
    var db: Connection?
    var userTable = Table("User")
    var id = SQLite.Expression<Int>("id")
    var name = SQLite.Expression<String>("name")
    var password = SQLite.Expression<String>("password")
    
    init(){
        connectToDatabse()
        createTable()
    }
    
    func saveUser(id:Int, name:String, password:String){
        if db != nil{
            
            let query = userTable.insert(self.id <- id,
                                            self.name <- name,
                                         self.password <- password)
            try! db?.run(query)
        }
        
    }
    
    func getAllUser() -> [User]{
        var cusArr = [User]()
        
        guard let db = db else {
            return cusArr
        }
        
        for row in try! db.prepare(userTable){
            print("-------------")
            let id = row[self.id]
            let name = row[self.name]
            let password = row[self.password]
            cusArr.append(User(id:id, name:name, paddword:password))
        }
        
        return cusArr
    }
    
    func createTable(){
        if db != nil{
            //let query1 = "create table if not exist expense(name text,amount integer, date text)";
            let query = userTable.create( ifNotExists: true){
                x in
                x.column(id)
                x.column(name)
                x.column(password)
            }
            do{
                try db?.run(query)
                print("table created")
            }catch{
                print("create table error \(error)")
            }
        }
    }
    
    func checkPassword(forUser name: String, inputPassword: String) -> Bool {
        guard let db = db else {
            print("Database not connected")
            return false
        }
        do {
            let query = userTable.filter(self.name == name)
            if let userRow = try db.pluck(query) {
                let storedPassword = userRow[self.password]
                return storedPassword == inputPassword
            } else {
                print("User not found")
                return false
            }
        } catch {
            print("Error checking password: \(error)")
            return false
        }
    }
    
    func connectToDatabse(){
        
        do{
            let path = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print("path \(path)")
            
            let completePath = path.appendingPathComponent("userdb.sqlite3")
            print("complete path \(completePath)")
            
            db = try Connection(completePath.path)
            print("DB Connected Successfully!")
        }catch{
            print("error \(error)")
        }
    }
}
