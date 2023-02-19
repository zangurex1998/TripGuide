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
        guard let url = URL(string: "https://run.mocky.io/v3/601e9d45-1ace-4e57-a03b-be00ea21fc7a") else {return}
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
