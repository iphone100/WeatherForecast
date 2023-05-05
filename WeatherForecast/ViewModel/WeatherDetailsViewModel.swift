//
//  WeatherDetailsViewModel.swift
//  WeatherForecast
//
//  Created by Ramanathan, Sathish Kumar (Cognizant) on 04/05/23.
//

import Foundation

// MARK: Protocol
protocol DataDelegate {
    func fetchCurrentDayData(_ data: CurrentDayWeatherData)
    func fetchCurrentDayError(_ error: UserError)

}

// MARK: WeatherDetails
class WeatherDetailsViewModel {
    
    var delegate: DataDelegate?
    var currentDay: CurrentDayWeatherData?
    let weatherApiCall : WeatherAPICall = WeatherAPICall.sharedInstance
    
    func fetchCurrentDayData() {
        weatherApiCall.dataParser{ [weak self] result in
            switch result{
            case .success(let results):
                DispatchQueue.main.async {
                    self?.delegate?.fetchCurrentDayData(results)
                }
            case .failure(let errors):
                print(errors)
                DispatchQueue.main.async {
                    self?.delegate?.fetchCurrentDayError(errors)
                }
            }
        }
    }
}
