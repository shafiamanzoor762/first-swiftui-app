//
//  CheckBox.swift
//  firstApp
//
//  Created by apple on 01/11/2024.
//

import SwiftUI

struct CheckBox: View {
    @Binding var state:Bool
    var text: String = ""
    var foregroundColor: Color = .black
    var body: some View {
        HStack{
            Image(systemName: state ? "checkmark.square": "square")
                .onTapGesture {
                    state.toggle()
                }
            Text(text)
        }.foregroundStyle(foregroundColor)
    }
}

#Preview {
    //CheckBox(state: state1)
}
