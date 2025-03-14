//
//  DrawerMenuView.swift
//  firstApp
//
//  Created by apple on 22/01/2025.
//

import SwiftUI

struct DrawerMenuView: View {
    @State var isDrawerOpen = false
    @State var activeScreen = "Home"

    var body: some View {
        ZStack{
            NavigationView{
                VStack{
                    if activeScreen == "Home" {
                        Button(action:{
                            withAnimation{
                                isDrawerOpen = true
                            }
                        }, label:{Text("Show Drawer")})
                    }else if activeScreen == "Counter" {
                        CounterView()
                    }else if activeScreen == "Login" {
                        LoginView()
                    }else if activeScreen == "Expense" {
                        ExpenseListView()
                    }
                }
                .toolbar(){
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action:{
                            withAnimation{
                                isDrawerOpen = true
                            }
                        }, label:{
                            Image(systemName: isDrawerOpen == true ? "xmark.app" : "line.horizontal.3")
                        })
                    }
                }
            }
            if isDrawerOpen {
                Color.gray.opacity(0.5)
                    .ignoresSafeArea(.all)
                    .onTapGesture {
                        withAnimation{
                            isDrawerOpen = false
                        }
                    }
            }
            if isDrawerOpen {
                HStack{
                    VStack(alignment: .leading){
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                            .padding(10)
                        Text("Profile - 1")
                            .font(.largeTitle)
                        Divider()
                        Button(action:{
                            
                            withAnimation{
                                activeScreen = "Home"
                                isDrawerOpen = false
                            }
                        }, label:{
                            Text("Home").frame(width: 100, height: 10).padding()
                        })
                        .background(activeScreen == "Home" ? Color.purple.opacity(0.5) : Color.clear)
                        .foregroundColor(activeScreen == "Home" ? Color.white : Color.primary)
                        .cornerRadius(8)
                        .animation(.easeInOut, value: activeScreen)
                        
                        Button(action:{
                            
                            withAnimation{
                                activeScreen = "Counter"
                                isDrawerOpen = false
                            }
                        }, label:{
                            Text("Counter").frame(width: 100, height: 10).padding()
                        })
                        .background(activeScreen == "Counter" ? Color.purple.opacity(0.5) : Color.clear)
                        .foregroundColor(activeScreen == "Counter" ? Color.white : Color.primary)
                        .cornerRadius(8)
                        .animation(.easeInOut, value: activeScreen)
                        
                        Button(action:{
                            
                            withAnimation{
                                activeScreen = "Login"
                                isDrawerOpen = false
                            }
                        }, label:{
                            Text("Login").frame(width: 100, height: 10).padding()
                        })
                        .background(activeScreen == "Login" ? Color.purple.opacity(0.5) : Color.clear) // Change the color when selected
                        .foregroundColor(activeScreen == "Login" ? Color.white : Color.primary) // Optional: Change text color
                        .cornerRadius(8) // Optional: For rounded corners
                        .animation(.easeInOut, value: activeScreen)
                        
                        Button(action:{
                            
                            withAnimation{
                                activeScreen = "Expense"
                                isDrawerOpen = false
                            }
                        }, label:{
                            Text("Expense").frame(width: 100, height: 10).padding()
                        })
                        .background(activeScreen == "Expense" ? Color.purple.opacity(0.5) : Color.clear) // Change the color when selected
                        .foregroundColor(activeScreen == "Expense" ? Color.white : Color.primary) // Optional: Change text color
                        .cornerRadius(8) // Optional: For rounded corners
                        .animation(.easeInOut, value: activeScreen)
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width:200)
                    .background(.white)
                    .ignoresSafeArea(.all)
                    Spacer()
                }.transition(.move(edge: .leading))
            }
        }
    }
}

#Preview {
    DrawerMenuView()
}
