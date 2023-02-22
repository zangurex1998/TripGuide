//
//  TourApiManager.swift
//  TripGuide
//
//  Created by technomix on 22.02.23.
//

import Foundation

protocol TourAPiManagerProtocol{
    func fetchingTours(completion: @escaping (ToursResponse) -> ())
}

class TourApiManager: TourAPiManagerProtocol{
    func fetchingTours(completion: @escaping (ToursResponse) -> ()) {
        guard let url = URL(string: "https://run.mocky.io/v3/e0f0bd34-d44b-4fba-bb84-4332ca765853") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                print(error)
            }
            guard let data = data else {return}
            do{
                let decoded = try JSONDecoder().decode(ToursResponse.self, from: data)
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
