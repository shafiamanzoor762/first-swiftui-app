//
//  HotelRoomFacilityViewModel.swift
//  firstApp
//
//  Created by apple on 06/11/2024.
//

import Foundation

class HotelRoomFacilityViewModel: ObservableObject{
    @Published var wifi = true
    @Published var parkingSpace = false
    @Published var breakfast = true
    
    @Published var roomOption: String = "Single Room"
    
    @Published var preferences:String = ""
    func showPreferences(){
        
        preferences = "\(wifi ? "wifi": "")\n \(parkingSpace ? "Perking Space": "")\n \(breakfast  ? "BreakFast": "")\n Type Room \nRoom Selected \(roomOption)"
    }
}
