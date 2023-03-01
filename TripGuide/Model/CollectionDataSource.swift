//
//  CollectionDataSource.swift
//  TripGuide
//
//  Created by technomix on 22.02.23.
//

import Foundation

class CollectionDataSource{
    static var shared = CollectionDataSource()
    let pageHeader: [LastPage] = [
        .init(cellHeader: "❤️ Liked Story "),
        .init(cellHeader: "📝 Planned Trip"),
        .init(cellHeader: "🏨 Favorite Hotels"),
        .init(cellHeader: "🍽 Favorite Restaurants"),
        .init(cellHeader: "✍️ My Blog")
        
    ]
    
}
