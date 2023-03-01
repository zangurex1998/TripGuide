//
//  RestaurantApiManager.swift
//  TouristGuide
//
//  Created by technomix on 13.02.23.
//

import Foundation
protocol RestaurantApiManagerProtocol{
    func fetchingHotels(completion: @escaping (RestaurantResponse) -> ())
}

class RestaurantApiManager: RestaurantApiManagerProtocol{
    func fetchingHotels(completion: @escaping (RestaurantResponse) -> ()) {
        guard let url = URL(string: "https://run.mocky.io/v3/903a1df1-6b24-4d86-8b2d-fc005397a291") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                print(error)
            }
            guard let data = data else {return}
            do{
                let decoded = try JSONDecoder().decode(RestaurantResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(decoded)
                }
            }
            catch{
                print(error)
            }
        }.resume()
    }
    
    
}
