//
//  ApiManager.swift
//  TouristGuide
//
//  Created by technomix on 10.02.23.
//

import Foundation
protocol ApiManagerProtocol{
    func fetchingCity(completion: @escaping (CityResponse) -> Void)
}
class Apimanager: ApiManagerProtocol{
    func fetchingCity(completion: @escaping (CityResponse) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/9373d9b6-c5fb-49d3-b472-9d2a7f424c73") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                print(error)
            }
            guard let data = data else { return}
            do{
                let decoded = try JSONDecoder().decode(CityResponse.self, from: data)
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
