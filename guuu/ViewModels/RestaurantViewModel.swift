//
//  RestaurantViewModel.swift
//  guuu
//
//  Created by Takumi Abe on 2020/05/23.
//  Copyright © 2020 Takumi Abe. All rights reserved.
//

import Foundation
import Combine

//class WeatherViewModel: ObservableObject {
//    private var weatherService: WeatherData
//    
//    @Published var weather = Restaurant()
//    
//    init() {
//        self.weatherService = WeatherData()
//    }
//    
//    var temperature: String {
//        if let temp = self.weather.temp {
//            return String(format: "%.0f", temp)
//        } else {
//            return ""
//        }
//    }
//    
//    var humidity: String {
//        if let humidity = self.weather.humidity {
//            return String(format: "%.0f", humidity)
//        } else {
//            return ""
//        }
//    }
//    
//    var cityName: String = ""
//    
//    func search() {
//        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
//        fetchWeather(by: city)
//        }
//    }
//    
//    private func fetchWeather(by city: String) {
//        
//        self.weatherService.getWeather(city: city) { weather in
//            if let weather = weather {
//                DispatchQueue.main.async {
//                    self.weather = weather
//                }
//            }
//            
//        }
//    }
//}


//class RestaurantViewModel: ObservableObject {
//    private var searchData: CurationData!
//
//    @Published var restaurant = Restaurant
//
//    init() {
//        self.searchData = CurationData()
//    }
//
//    var
//
//    private func fetchData(by word: String) {
//
//
//        self.searchData.getData(freeWord: word) { restaurant in
//            if let resant {
//!= nil            self.restaurant = restaurant
//            }
//
//        }
//    }
//}
