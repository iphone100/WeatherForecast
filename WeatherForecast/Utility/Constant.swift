//
//  Constant.swift
//  WeatherForecast
//
//  Created by Ramanathan, Sathish Kumar (Cognizant) on 04/05/23.
//

import Foundation

//MARK: Constants
struct API {
    static let key = "c370ab7d11f38ca2e01c67964b36662c"
}

struct Units {
    static let celcius = "metric"
}

struct STRING {
    //Key
    static let CityNameKey      = "CityName"
    
    //String
    static let EnterCityName    = "Please enter a city name."
    static let Sorry            = "Sorry"
    static let AlertTitle       = "Alert"
    static let OkTitle          = "Ok"
    static let NavTitleForecast = "Forecast"
    static let NavTitleError    = "Error"
    static let Clouds           = "Clouds"
    static let Cloudy           = "Cloudy"
    static let Mist             = "Mist"
    static let Rain             = "Rain"
    static let Rainy            = "Rainy"
    static let Clear            = "Clear"
    static let Sunny            = "Sunny"
    static let Thunderstorm     = "Thunderstorm"
    static let Thunder          = "Thunder"
    static let Weather          = "Weather"
    static let Drizzle          = "Drizzle"
    
    //ViewControllers
    static let WeatherDetailsVC = "WeatherDetails"
    
    //Fonts
    static let VerdanaBoldFont  = "Verdana-bold"
    
    //Alert action style
    static let Default          = "default"
    static let Cancel           = "cancel"
    static let Destructive      = "destructive"
}
