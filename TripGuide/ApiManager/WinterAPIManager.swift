//
//  WinterAPIManager.swift
//  TripGuide
//
//  Created by technomix on 20.02.23.
//

import Foundation

protocol WinterApiManagerProtocol{
    func fetchingHotels(completion: @escaping (WinterResponse) -> ())
}

class WinterApiManager: WinterApiManagerProtocol{
    func fetchingHotels(completion: @escaping (WinterResponse) -> ()) {
        guard let url = URL(string: "https://run.mocky.io/v3/4c2526b2-e1fa-437a-aec7-33ff8de8ce5b"  ) else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                print(error)
            }
            guard let data = data else {return}
            do{
                let decoded = try JSONDecoder().decode(WinterResponse.self, from: data)
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
