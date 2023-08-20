//
//  Constants.swift
//  WeatherAppApi
//
//  Created by Sarah on 19/08/2023.
//

import Foundation
struct Constants {
    struct Urls {
        static func weatherByCity(city: String) -> URL? {
            return URL(string:"https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=c45294a1f2a285a0e58c76e72aa1cdbb")
        }
        
        static func weatherUrlAsStringByIcon(icon: String) -> String {
            return "https://openweathermap.org/img/w/\(icon).png"
        }
    }
}


