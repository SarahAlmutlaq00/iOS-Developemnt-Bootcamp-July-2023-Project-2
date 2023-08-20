//
//  AddWeatherViewModel.swift
//  WeatherAppApi
//
//  Created by Sarah on 19/08/2023.
//

import Foundation

class AddWeatherViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    var city: String = ""
    
    func save(completion: @escaping (WeatherViewModel) -> Void) {
        
        Webservice().getWeatherByCity(city: city) { (result) in
            switch result {
                case .success(let weather):
                    DispatchQueue.main.async {
                        completion(WeatherViewModel(weather: weather))
                    }
                case .failure(let error):
                    print(error)
            }
        }
        
    }
    
    
}
