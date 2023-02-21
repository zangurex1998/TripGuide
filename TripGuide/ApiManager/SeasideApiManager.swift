//
//  SeasideApiManager.swift
//  TripGuide
//
//  Created by technomix on 18.02.23.
//

import Foundation

protocol SeasideApiManagerProtocol{
    func fetchingSeasides(completion: @escaping (SeasidesResponse) -> ())
}

class SeasideApiManager: SeasideApiManagerProtocol{    
    func fetchingSeasides(completion: @escaping (SeasidesResponse) -> ()) {
        guard let url = URL(string: "https://run.mocky.io/v3/7ec55407-c36e-4f36-af8f-eeb0f0f47aa5") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                print(error)
            }
            guard let data = data else {return}
            do{
                let decoded = try JSONDecoder().decode(SeasidesResponse.self, from: data)
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
