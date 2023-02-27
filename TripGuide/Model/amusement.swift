//
//  amusement.swift
//  TripGuide
//
//  Created by technomix on 27.02.23.
//

import Foundation

struct AmusementResponse: Codable{
    let amusement: [Amusment]
}

struct Amusment: Codable {
    let name: String
    let about: String
    let image: String
}
