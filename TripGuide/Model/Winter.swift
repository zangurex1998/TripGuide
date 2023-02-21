//
//  Winter.swift
//  TripGuide
//
//  Created by technomix on 20.02.23.
//

import Foundation
struct WinterResponse: Codable {
    let winter : [Winter]
}

struct Winter: Codable {
    let name: String
    let image: String
    let hotelImage: String
    let hotelName: String
    let hotelRate: Double
    let hotelInfo: String
    let hotelPrice: String
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
   
    let hotelImageTwo: String
}
