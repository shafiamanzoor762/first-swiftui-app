//
//  HotelRoomFacilityView.swift
//  firstApp
//
//  Created by apple on 06/11/2024.
//

import SwiftUI

struct HotelRoomFacilityView: View {
    
    @StateObject var hotelRoomFacility: HotelRoomFacilityViewModel = HotelRoomFacilityViewModel()
    
    @State var isAlertShown = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Facilities")
            CheckBox(state: $hotelRoomFacility.wifi, text: "Wifi")
            CheckBox(state: $hotelRoomFacility.parkingSpace, text: "Parking Space")
            CheckBox(state: $hotelRoomFacility.breakfast, text: "Breakfast")
            Text("Room Type")
            RadioButton(selectedText: $hotelRoomFacility.roomOption, text: "Single Room")
            RadioButton(selectedText: $hotelRoomFacility.roomOption, text: "Double Room")
            RadioButton(selectedText: $hotelRoomFacility.roomOption, text: "Suite")
            
            Button(action:{
                hotelRoomFacility.showPreferences()
                isAlertShown = true
            }, label:{
                Text("View Preferences")
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(.yellow)
                    .cornerRadius(10)
                    .foregroundStyle(.black).padding()
            })
            .alert(isPresented: $isAlertShown){
                Alert(title: Text("Your selected Preferences"), message: Text("\(hotelRoomFacility.preferences)"),dismissButton: .default(Text("Ok")))
            }
            Spacer()
        }
    }
}

#Preview {
    HotelRoomFacilityView(isAlertShown: false)
}
