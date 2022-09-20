//
//  WeatherService.swift
//  VIPER
//
//  Created by Sergio on 15.09.22.
//

import Foundation

class WeatherService {
    func getWeather(completion: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let temperature = Int.random(in: -30...30)
            completion(temperature)
        }
    }
}
