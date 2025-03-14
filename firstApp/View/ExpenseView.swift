
import SwiftUI

struct ExpenseView: View {
    @State var expName: String = ""
    @State var expAmt: String = ""
    @State var expDate: String = ""
    
    @State var expData = [Expense]()
    
    var body: some View {
        VStack{
            Text("Expense Name")
            TextField("", text: $expName)
                .padding(.all, 5)
                .background(.white)
                .border(.gray,width: 1)
                .cornerRadius(10).padding()
            Text("Expense Amount")
            TextField("", text: $expAmt)
                .padding(.all, 5)
                .background(.white)
                .border(.gray,width: 1)
                .cornerRadius(10).padding()
            Text("Date of Expense")
            TextField("", text: $expDate)
                .padding(.all, 5)
                .background(.white)
                .border(.gray,width: 1)
                .cornerRadius(10).padding()
            Button(action:{
                let manager = DBManager()
                manager.saveExpense(name: expName, amount: expAmt, date: expDate)
                manager.getAllExpenses()
            },label:{
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(.yellow)
                    .cornerRadius(10)
                    .foregroundStyle(.black).padding()
            })
            
            List{
                ForEach(expData){e in
                    Text("\(e)")
                }
            }
            
        }.onAppear(){
            let manager = DBManager()
            expData = manager.getAllExpenses()
        }
    }
}

#Preview {
    ExpenseView(expName: "", expAmt: "", expDate: "")
}
