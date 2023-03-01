//
//  Restaurant.swift
//  TouristGuide
//
//  Created by technomix on 13.02.23.
//

import Foundation

struct RestaurantResponse: Codable{
    let restaurants: [Restaurant]
}

struct Restaurant: Codable{
    let city: String
    let location: String
    let name: String
    let image: String
    let imageTwo: String
    let rate: Int
    let priceRange: String
    let specialDiets: String
    let food: String
    let contact: String
    let value: String
    let service: String
    
}
