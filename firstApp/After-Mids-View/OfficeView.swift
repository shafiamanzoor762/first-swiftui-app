//
//  OfficeView.swift
//  firstApp
//
//  Created by apple on 24/01/2025.
//

import SwiftUI

struct OfficeView: View {
    @State var room = ["B1", "B2", "B3"]
    @State var roomSelectedText: String = ""
    @State var floor = ["Floor1", "Floor2", "Floor3"]
    @State var floorSelectedText: String = ""
    @State var roomList = [
        Room(
            no: "Floor1",
            officeTitle: "B1",
            members: [
                Members(Name: "Alice", Desig: "Manager", City: "New York", Gender: "Female"),
                Members(Name: "Bob", Desig: "Developer", City: "Los Angeles", Gender: "Male"),
                Members(Name: "Eve", Desig: "Designer", City: "Chicago", Gender: "Female")
            ]
        ),
        Room(
            no: "Floor2",
            officeTitle: "B2",
            members: [
                Members(Name: "Charlie", Desig: "HR", City: "San Francisco", Gender: "Male"),
                Members(Name: "Dave", Desig: "Analyst", City: "Houston", Gender: "Male"),
                Members(Name: "Fiona", Desig: "Marketing", City: "Miami", Gender: "Female")
            ]
        ),
        Room(
            no: "Floor3",
            officeTitle: "B3",
            members: [
                Members(Name: "Grace", Desig: "Sales", City: "Seattle", Gender: "Female"),
                Members(Name: "Hank", Desig: "Support", City: "Denver", Gender: "Male"),
                Members(Name: "Ivy", Desig: "Product Manager", City: "Boston", Gender: "Female")
            ]
        )
    ]
    //@State var roomsFiltered = [Room]()
    var body: some View {
        VStack(alignment: .leading) {
            Text("First Application")
            Text("Select Floor")
            DropDown(options: floor, selectedOption: $floorSelectedText)
            Text("Select Office Title")
            DropDown(options: room, selectedOption: $roomSelectedText)
            
            let filteredRooms = roomList.filter { room in
                            let floorMatch = floorSelectedText.isEmpty || room.no == floorSelectedText
                            let officeMatch = roomSelectedText.isEmpty || room.officeTitle == roomSelectedText
                            return floorMatch && officeMatch
                        }
            
            if !filteredRooms.isEmpty {
                Text("Filtered Results:")
                    .font(.headline)
                    .padding(.top, 16)
                
                List{
                    ForEach(filteredRooms, id: \.no) { room in
                        Text("Floor: \(room.no), Office: \(room.officeTitle)").font(.subheadline)
                            .bold()
                        
                        ForEach(room.members, id: \.Name) { member in
                            Text("Name: \(member.Name)\nDesignation: \(member.Desig)\nCity: \(member.City)\nGender: \(member.Gender)")
                            .font(.body)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    OfficeView()
}
