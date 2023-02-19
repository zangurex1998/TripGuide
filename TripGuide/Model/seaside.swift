//
//  seaside.swift
//  TripGuide
//
//  Created by technomix on 18.02.23.
//

import Foundation

struct SeasidesResponse: Codable{
    let seasides: [Seasides]
}

struct Seasides: Codable{
    let beach: String
    let image: String
    let hotelImage: String
    let hotelName: String
    let hotelRate: Double
    let hotelInfo: String
    let hotelPrice: String
}
