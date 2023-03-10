//
//  hotel.swift
//  TouristGuide
//
//  Created by technomix on 11.02.23.
//

import Foundation

struct HotelResponse: Codable{
    let hotels: [Hotels]
}
struct Hotels:Codable {
    let city: String
    let location: String
    let name: String
    let image: String
    let imageTwo: String
    let imageThree: String
    let imageFour: String
    let imageFive: String
    let rate: Double
    let price: String
    let reserve: Bool
    let description: String
    let wifi: Bool // amenities
    let gym: Bool // amenities
    let freeParking: Bool // amenitiess
    let swimmingPool: Bool //amenities
    let minibar: Bool // amenities
    let familyRooms: Bool // amenities
    let freeBreakfast: Bool // amenities
    let privateBalcony: Bool //roomFeatures
    let roomService: Bool //roomFeatures
    let refrigerator: Bool //roomFeatures
    let nonSmokingRoom: Bool // roomFeatures
    let romantic: Bool // roomFeatures
}
