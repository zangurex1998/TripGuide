//
//  AmusementApiManager.swift
//  TripGuide
//
//  Created by technomix on 27.02.23.
//

import Foundation
protocol AmusementApiManagerProtocol{
    func fetchingAmusement(completion: @escaping (AmusementResponse) -> ())
}

class AmusementApiManager: AmusementApiManagerProtocol{
    func fetchingAmusement(completion: @escaping (AmusementResponse) -> ()) {
        guard let url = URL(string: "https://run.mocky.io/v3/f815e4a4-8d0f-4d4c-8bb3-f9e4a4fe02ed") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error{
                print(error)
            }
            guard let data = data else {return}
            do{
                let decoded = try JSONDecoder().decode(AmusementResponse.self, from: data)
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
