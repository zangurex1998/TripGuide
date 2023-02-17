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
}
