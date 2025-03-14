//
//  DBCustomer.swift
//  firstApp
//
//  Created by apple on 16/12/2024.
//

import Foundation
import SQLite
class DBCustomer{
    var db: Connection?
    var customerTable = Table("customer")
    var id = SQLite.Expression<Int>("id")
    var order = SQLite.Expression<String>("order")
    var bill = SQLite.Expression<Int>("bill")
    
    init(){
        connectToDatabse()
        createTable()
    }
    
    func saveCustomer(id:Int, order:String, bill:Int){
        if db != nil{
            
            let query = customerTable.insert(self.id <- id,
                                            self.order <- order,
                                            self.bill <- bill)
            try! db?.run(query)
        }
        
    }
    
    func editCustomer(id: Int, newOrder: String?, newBill: Int?) {
        guard let db = db else { return }

        var setters = [Setter]()
        if let newOrder = newOrder {
            setters.append(self.order <- newOrder)
        }
        if let newBill = newBill {
            setters.append(self.bill <- newBill)
        }
        
        let customer = customerTable.filter(self.id == id)
        do {
            try db.run(customer.update(setters))
            print("Customer updated successfully")
        } catch {
            print("Error updating customer: \(error)")
        }
    }
    
    func deleteCustomer(id: Int) {
        guard let db = db else { return }
        
        let customer = customerTable.filter(self.id == id)
        do {
            try db.run(customer.delete())
            print("Customer deleted successfully")
        } catch {
            print("Error deleting customer: \(error)")
        }
    }

    
    func getAllCustomer() -> [Customer]{
        var cusArr = [Customer]()
        
        guard let db = db else {
            return cusArr
        }
//        for row in try! db.prepare("select * from expense"){
//            print("-------------")
//            let name = row[0]! as! String
//            let amount = row[1]! as! Int64
//            let date = row[2]! as! String
//            expArr.append(Expense(name: name, amount: Int(amount), date: date))
//        }
        
        for row in try! db.prepare(customerTable){
            print("-------------")
            let id = row[self.id]
            let order = row[self.order]
            let bill = row[self.bill]
            cusArr.append(Customer(id:id, order:order, bill:bill))
        }
        
        return cusArr
    }
    
    func createTable(){
        if db != nil{
            //let query1 = "create table if not exist expense(name text,amount integer, date text)";
            let query = customerTable.create( ifNotExists: true){
                x in
                x.column(id)
                x.column(order)
                x.column(bill)
            }
            do{
                try db?.run(query)
                print("table created")
            }catch{
                print("create table error \(error)")
            }
        }
    }
    
    func connectToDatabse(){
        
        do{
            let path = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print("path \(path)")
            
            let completePath = path.appendingPathComponent("customerdb.sqlite3")
            print("complete path \(completePath)")
            
            db = try Connection(completePath.path)
            print("DB Connected Successfully!")
        }catch{
            print("error \(error)")
        }
    }
}
