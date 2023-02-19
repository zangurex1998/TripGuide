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
        guard let url = URL(string: "https://run.mocky.io/v3/8c2b8e94-53f8-4613-b500-6471b6034929") else {return}
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
