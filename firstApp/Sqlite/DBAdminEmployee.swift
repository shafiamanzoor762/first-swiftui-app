import Foundation
import SQLite

class DBHandler {
    var db: Connection?

    // MARK: - User Table
    let userTable = Table("user")
    let userId = SQLite.Expression<Int>("id")
    let userName = SQLite.Expression<String>("name")
    let userPassword = SQLite.Expression<String>("password")
    let userCategory = SQLite.Expression<String>("category") // Admin or Employee

    // MARK: - Employee Table
    let employeeTable = Table("employee")
    let employeeId = SQLite.Expression<Int>("id")
    let employeeName = SQLite.Expression<String>("employeeName")
    let employeeDepartment = SQLite.Expression<String>("department") // HR, Training, IT and Software, Accounts
    let employeeRole = SQLite.Expression<String>("role") // Manager, Trainer, Worker
    let employeeAssignedProject = SQLite.Expression<String>("assignedProject")

    init() {
        connectToDatabase()
        createTables()
    }

    func connectToDatabase() {
        do {
            let path = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print(path)
            let completePath = path.appendingPathComponent("appdb.sqlite3")
            db = try Connection(completePath.path)
            print("Database connected successfully!")
        } catch {
            print("Error connecting to database: \(error)")
        }
    }

    func createTables() {
        do {
            // Create User Table
            try db?.run(userTable.create(ifNotExists: true) { table in
                table.column(userId, primaryKey: true)
                table.column(userName)
                table.column(userPassword)
                table.column(userCategory)
            })
            print("User table created")

            // Create Employee Table
            try db?.run(employeeTable.create(ifNotExists: true) { table in
                table.column(employeeId, primaryKey: true)
                table.column(employeeName)
                table.column(employeeDepartment)
                table.column(employeeRole)
                table.column(employeeAssignedProject)
            })
            print("Employee table created")
        } catch {
            print("Error creating tables: \(error)")
        }
    }

    // MARK: - User Operations
    func saveUser(user: Userr) {
        do {
            try db?.run(userTable.insert(
                userId <- user.id,
                userName <- user.name,
                userPassword <- user.password,
                userCategory <- user.category
            ))
            print("User saved successfully")
        } catch {
            print("Error saving user: \(error)")
        }
    }
    
    func getAllUsers() -> [Userr] {
        var users = [Userr]()
        do {
            if let rows = try db?.prepare(userTable) {
                for row in rows {
                    let user = Userr(
                        id: row[userId],
                        name: row[userName],
                        password: row[userPassword],
                        category: row[userCategory]
                    )
                    users.append(user)
                }
            }
        } catch {
            print("Error fetching users: \(error)")
        }
        return users
    }


    // MARK: - Employee Operations
    func saveEmployee(employee: Employee) {
        do {
            try db?.run(employeeTable.insert(
                employeeId <- employee.id,
                employeeName <- employee.employeeName,
                employeeDepartment <- employee.department,
                employeeRole <- employee.role,
                employeeAssignedProject <- employee.assignedProject
            ))
            print("Employee saved successfully")
        } catch {
            print("Error saving employee: \(error)")
        }
    }
    
    func assignProject(employeeId: Int, project: String) {
        guard let db = db else { return }

        let employee = employeeTable.filter(self.employeeId == employeeId)
        do {
            try db.run(employee.update(self.employeeAssignedProject <- project))
            print("Project assigned successfully.")
        } catch {
            print("Error assigning project: \(error)")
        }
    }

    func getEmployeeById(employeeId: Int) -> Employee? {
        guard let db = db else { return nil }

        let employee = employeeTable.filter(self.employeeId == employeeId)
        do {
            if let row = try db.pluck(employee) {
                return Employee(
                    id: row[self.employeeId],
                    employeeName: row[self.employeeName],
                    department: row[self.employeeDepartment],
                    role: row[self.employeeRole],
                    assignedProject: row[self.employeeAssignedProject]
                )
            }
        } catch {
            print("Error fetching employee: \(error)")
        }
        return nil
    }

    func getEmployeeCountByDepartment(department: String) -> Int {
        guard let db = db else { return 0 }

        let employeesInDept = employeeTable.filter(self.employeeDepartment == department)
        do {
            return try db.scalar(employeesInDept.count)
        } catch {
            print("Error counting employees in department: \(error)")
        }
        return 0
    }

    func updateEmployee(
        employeeId: Int,
        newName: String?,
        newDepartment: String?,
        newRole: String?,
        newAssignedProject: String?
    ) {
        guard let db = db else { return }

        let employee = employeeTable.filter(self.employeeId == employeeId)
        var setters = [Setter]()
        
        if let newName = newName {
            setters.append(self.employeeName <- newName)
        }
        if let newDepartment = newDepartment {
            setters.append(self.employeeDepartment <- newDepartment)
        }
        if let newRole = newRole {
            setters.append(self.employeeRole <- newRole)
        }
        if let newAssignedProject = newAssignedProject {
            setters.append(self.employeeAssignedProject <- newAssignedProject)
        }
        
        do {
            try db.run(employee.update(setters))
            print("Employee updated successfully.")
        } catch {
            print("Error updating employee: \(error)")
        }
    }

    func deleteEmployee(employeeId: Int) {
        guard let db = db else { return }

        let employee = employeeTable.filter(self.employeeId == employeeId)
        do {
            try db.run(employee.delete())
            print("Employee deleted successfully.")
        } catch {
            print("Error deleting employee: \(error)")
        }
    }

    func getAllEmployees() -> [Employee] {
        var employees = [Employee]()
        do {
            if let rows = try db?.prepare(employeeTable) { // Safely unwrap rows
                for row in rows {
                    let employee = Employee(
                        id: row[employeeId],
                        employeeName: row[employeeName],
                        department: row[employeeDepartment],
                        role: row[employeeRole],
                        assignedProject: row[employeeAssignedProject]
                    )
                    employees.append(employee)
                }
            }
        } catch {
            print("Error fetching employees: \(error)")
        }
        return employees
    }

    
}
