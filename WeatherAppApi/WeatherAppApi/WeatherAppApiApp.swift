//
//  WeatherAppApiApp.swift
//  WeatherAppApi
//
//  Created by Sarah on 19/08/2023.
//

import SwiftUI

@main

struct WeatherAppApiApp: App {
    var body: some Scene {
        WindowGroup {
            WeatherList().environmentObject(Store())
        }
    }
}
