//
//  hotelsAPIManager.swift
//  TouristGuide
//
//  Created by technomix on 11.02.23.
//


import Foundation


protocol HotelApiManagerProtocol{
    func fetchingHotels(completion: @escaping (HotelResponse) -> ())
}

class HotelApiManager: HotelApiManagerProtocol{
    func fetchingHotels(completion: @escaping (HotelResponse) -> ()) {
        guard let url = URL(string: "https://run.mocky.io/v3/301f818c-66ff-44fa-919c-e1aea596e936"  ) else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                print(error)
            }
            guard let data = data else {return}
            do{
                let decoded = try JSONDecoder().decode(HotelResponse.self, from: data)
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
