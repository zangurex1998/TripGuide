//
//  City.swift
//  TouristGuide
//
//  Created by technomix on 10.02.23.
//

import Foundation


struct CityResponse: Codable{
    let cities: [City]
}

struct City: Codable{
    let city: String
    let image: String
    let imageTwo: String
    let story: String
    let detailedStory: String
}
