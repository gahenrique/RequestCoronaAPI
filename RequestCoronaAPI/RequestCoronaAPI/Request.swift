//
//  Request.swift
//  RequestCoronaAPI
//
//  Created by gabriel on 02/04/20.
//  Copyright © 2020 gabriel. All rights reserved.
//

import Foundation

class Requests {
    
    public static func getCountryCases(country: String, completionHandler: @escaping (_ countryCases: CountryCases) -> Void) {
        
        guard let requestURL = URL(string: "https://corona.lmao.ninja/countries/\(country)") else { return }
        
        let task = URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            if error != nil { return }
            
            if let data = data {
                do {
                    let countryCases = try JSONDecoder().decode(CountryCases.self, from: data)
                    
                    DispatchQueue.main.async { // Correct
                        completionHandler(countryCases)
                    }
                } catch let error {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
