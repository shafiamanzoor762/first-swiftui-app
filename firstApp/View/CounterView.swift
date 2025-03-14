//
//  CounterView.swift
//  firstApp
//
//  Created by apple on 23/10/2024.
//

import SwiftUI

struct CounterView: View {
    @State var count: Int = 0
    
    var body: some View {
        VStack{
            Text("Counter : \(count)")
            
            Button("Increment", action: {
                count = count + 1
            })
                .foregroundStyle(.white)
                .frame(width: 200, height: 30)
                .background(.cyan)
            
            Button(action:{
                if(count > 0)
                {
                    count = count - 1
                }
            }, label:{
                Text("Decrement")
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 30)
                    .background(.cyan)
            })
            Button(action:{
                count = 0
            }, label:{
                Text("Reset")
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 30)
                    .background(.cyan)
            })
        }
    }
}

#Preview {
    CounterView()
}
