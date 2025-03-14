
import SwiftUI

struct  DropDownMenuDemo: View {
    
    let fruits = ["apple", "banana", "orange", "kiwi"]
    @State  private  var selectedOptionIndex =  0
    @State  private  var showDropdown =  false
    
    var body: some  View {
        VStack {
            DropDownMenu(options: fruits, selectedOptionIndex: $selectedOptionIndex, showDropdown: $showDropdown)
            Spacer()
                .frame(height: 30)
            Text("You have selected \(fruits[selectedOptionIndex])")
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.yellow)
        .onTapGesture {
            withAnimation {
                showDropdown =  false
            }
        }
    }
}


#Preview {
    DropDownMenuDemo()
}
