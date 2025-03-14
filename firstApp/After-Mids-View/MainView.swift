//
//  MainView.swift
//  firstApp
//
//  Created by apple on 15/01/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            AddContactView1().tabItem({
                Image(systemName: "plus")
                Text("Add")
            })
            ShowAllContactsView1().tabItem({
                Image(systemName: "person")
                Text("Show all")
            })
            EditContactView().tabItem({
                Image(systemName: "pencil")
                Text("Edit")
            })
        }
    }
}

#Preview {
    MainView()
}
