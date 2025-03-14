//
//  RadioButton.swift
//  firstApp
//
//  Created by apple on 30/10/2024.
//

import SwiftUI

struct RadioButton: View {
    @Binding var selectedText:String
    var text: String = ""
    var foregroundColor: Color = .black
    var body: some View {
        HStack{

            Image(systemName: text == selectedText ? "inset.filled.circle": "circle")
                .onTapGesture {
                    selectedText = text
                    //state.toggle()
                }
            Text(text)
        }.foregroundStyle(foregroundColor)
    }
}

#Preview {
    //RadioButton(text: "demo", foregroundColor: .blue)
}
