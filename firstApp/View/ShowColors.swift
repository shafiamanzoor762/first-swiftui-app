//
//  ShowColors.swift
//  firstApp
//
//  Created by apple on 28/10/2024.
//

import SwiftUI

struct ShowColors: View {
    @State var col: Color = .cyan
    var body: some View {
        VStack{
            Spacer()
            Button(action:{
                col = .red
            }, label:{
                Text("Red")
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 30)
                    .background(.red)
            })
            Button(action:{
                col = .blue
            }, label:{
                Text("Blue")
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 30)
                    .background(.blue)
            })
            Button(action:{
                col = .black
            }, label:{
                Text("Black")
                    .foregroundStyle(.white)
                    .frame(width: 200, height: 30)
                    .background(.black)
            })
            Text("Color is \(col)").foregroundStyle(.white)
                .frame(width: 1000, height: 600)
        }.background(col)
    }
}

#Preview {
    ShowColors()
}
