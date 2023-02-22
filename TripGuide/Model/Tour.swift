//
//  Tour.swift
//  TripGuide
//
//  Created by technomix on 22.02.23.
//

import Foundation

struct ToursResponse: Codable{
    let tours: [Tour]
    
}

struct Tour: Codable{
    let name: String
    let about: String
    let price: String
    let image: String
    let ages: String
    let duration: String
    let languages: String
    let coffeeOrTea: Bool
    let beveragesIncluded: Bool
    let breakfast: Bool
    let wineDegustation: Bool
    let AirConditionerVehicle: Bool
    let phoneNumber: String 
    let rate: Int
}
