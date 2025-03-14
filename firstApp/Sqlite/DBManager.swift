//
//  DBManager.swift
//  firstApp
//
//  Created by apple on 20/11/2024.
//

import Foundation
import SQLite
class DBManager{
    var db: Connection?
    var expenseTable = Table("expense")
    var name = SQLite.Expression<String>("name")
    var amount = SQLite.Expression<String>("amount")
    var date = SQLite.Expression<String>("date")
    
    init(){
        connectToDatabse()
        createTable()
    }
    
    func saveExpense(name:String, amount:String, date:String){
        if db != nil{
//             let query = "insert into expense values (?,?,?)"
//            try! db?.run(query, name, amount, date)
            
            let query = expenseTable.insert(self.name <- name,
                                            self.amount <- amount,
                                            self.date <- date)
            try! db?.run(query)
        }
        
    }
    
    func getAllExpenses() -> [Expense]{
        var expArr = [Expense]()
        
        guard let db = db else {
            return expArr
        }
//        for row in try! db.prepare("select * from expense"){
//            print("-------------")
//            let name = row[0]! as! String
//            let amount = row[1]! as! Int64
//            let date = row[2]! as! String
//            expArr.append(Expense(name: name, amount: Int(amount), date: date))
//        }
        
        for row in try! db.prepare(expenseTable){
            print("-------------")
            let name = row[self.name]
            let amount = row[self.amount]
            let date = row[self.date]
            expArr.append(Expense(name: name, amount: amount, date: date))
        }
        
        return expArr
    }
    
    func createTable(){
        if db != nil{
            //let query1 = "create table if not exist expense(name text,amount integer, date text)";
            let query = expenseTable.create( ifNotExists: true){
                x in
                x.column(name)
                x.column(amount)
                x.column(date)
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
            
            let completePath = path.appendingPathComponent("expensedb.sqlite3")
            print("complete path \(completePath)")
            
            db = try Connection(completePath.path)
            print("DB Connected Successfully!")
        }catch{
            print("error \(error)")
        }
    }
}
