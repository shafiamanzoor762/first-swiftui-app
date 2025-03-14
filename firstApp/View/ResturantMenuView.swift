////
////  ResturantMenuView.swift
////  firstApp
////
////  Created by apple on 22/11/2024.
////
//
//import SwiftUI
//
//struct ResturantMenuView: View {
//    @State var selectedCategory = "All"
//    @State var selectedPriceRange = "All"
//    
//    var category = ["All", "Appetizers", "Main Course", "Deserts"]
//    var  priceRange = ["All", "Below 1000 PKR", "1000 - 1500 PKR", "Above 1500 PKR"]
//    @State var allCategory = ["Spring Rolls", "Cheese Burger", "Pasta Alfredo", "Chocolate Cake"]
//    let menuItems: [ResturantMenu] = [ResturantMenu(name: "Spring Rolls", category: "Appetizers", priceRange: 500), ResturantMenu(name: "Cheese Burger", category: "Main Course", priceRange: 800), ResturantMenu(name: "Pasta Alfredo", category: "Main Course", priceRange: 1200),ResturantMenu(name: "Chocolate Cake", category: "Deserts", priceRange: 400)]
//    
//    //@State var result : [ResturantMenu] = []
//    var filteredMenu: [ResturantMenu] {
//        menuItems.filter {item in
//            // Filter by category
//            (selectedCategory == "All" || item.category == selectedCategory) &&
//            // Filter by price range
//            (selectedPriceRange == "All" ||
//             (selectedPriceRange == "Below 1000 PKR" && item.price < 1000) ||
//             (selectedPriceRange == "1000 - 1500 PKR" && item.price >= 1000 && item.price <= 1500) ||
//             (selectedPriceRange == "Above 1500 PKR" && item.price > 1500))
//        }
//    }
//
//    
//    var body: some View {
//        VStack(alignment: .leading){
//            
//            Text("Select Category")
//            DropDown(options: category, selectedOption: $selectedCategory)
//            Text("Select Price Range")
//            DropDown(options: priceRange, selectedOption: $selectedPriceRange)
//            
//
//                //                if(selectedCategory == "All"){
//                //                    result = resturantMenu
//                //                }
//                //                else{
//                //                    result = resturantMenu.filter({r in
//                //                        r.category.contains(selectedCategory)})
//                //                }
//                //
//                //                if(selectedPriceRange == "All"){
//                //                    result = resturantMenu
//                //                }else if(selectedPriceRange == "Below 1000 PKR"){
//                //                    result = resturantMenu.filter({r in
//                //                        r.priceRange <= 1000})
//                //                }
//                
//            
//            List {
//                ForEach(filteredMenu,id: \.self.category) { item in
//                    VStack(alignment: .leading) {
//                        Text("Name: \(item.name)")
//                        Text("Category: \(item.category)")
//                        Text("Price: \(item.price) PKR")
//                    }
//                    .padding()
//                }
//            }
//
//        }
//    }
//}
//
//#Preview {
//    ResturantMenuView()
//}



import SwiftUI

// Restaurant Menu Model
struct RestaurantMenu: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let price: Int
}

struct RestaurantMenuView: View {
    // State variables for selected dropdown values
    @State private var selectedCategory = "All"
    @State private var selectedPriceRange = "All"

    // Dropdown options
    let categories = ["All", "Appetizers", "Main Course", "Deserts"]
    let priceRanges = ["All", "Below 1000 PKR", "1000 - 1500 PKR", "Above 1500 PKR"]

    // Restaurant menu data
    let menuItems: [RestaurantMenu] = [
        RestaurantMenu(name: "Spring Rolls", category: "Appetizers", price: 500),
        RestaurantMenu(name: "Cheese Burger", category: "Main Course", price: 800),
        RestaurantMenu(name: "Pasta Alfredo", category: "Main Course", price: 1200),
        RestaurantMenu(name: "Chocolate Cake", category: "Deserts", price: 400)
    ]

    var filteredMenu: [RestaurantMenu] {
        menuItems.filter { item in
            // Filter by category
            (selectedCategory == "All" || item.category == selectedCategory) &&
            // Filter by price range
            (selectedPriceRange == "All" ||
             (selectedPriceRange == "Below 1000 PKR" && item.price < 1000) ||
             (selectedPriceRange == "1000 - 1500 PKR" && item.price >= 1000 && item.price <= 1500) ||
             (selectedPriceRange == "Above 1500 PKR" && item.price > 1500))
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Restaurant Menu")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            // Dropdown for Category Selection
            Text("Select Category")
                .font(.headline)
            Picker("Select Category", selection: $selectedCategory) {
                ForEach(categories, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding(.horizontal)

            // Dropdown for Price Range Selection
            Text("Select Price Range")
                .font(.headline)
            Picker("Select Price Range", selection: $selectedPriceRange) {
                ForEach(priceRanges, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding(.horizontal)

            // Display Filtered Menu Items
            List(filteredMenu) { item in
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text("\(item.category) - \(item.price) PKR")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    RestaurantMenuView()
}
