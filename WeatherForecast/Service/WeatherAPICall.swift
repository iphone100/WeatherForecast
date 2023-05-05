//
//  WeatherAPICall.swift
//  WeatherForecast
//
//  Created by Ramanathan, Sathish Kumar (Cognizant) on 04/05/23.
//

import Foundation

//MARK: Error
enum UserError: Error {
    case dataNotAvailable
    case noNetWorkAccess
    case inValidURL
    case cannotProcessData
    case invalidResponse
}
        
struct WeatherAPICall {
    // Shared Instance
    static let sharedInstance = WeatherAPICall()
    
    //MARK: Fetch API data
    func dataParser(completion: @escaping (Result<CurrentDayWeatherData, UserError>) -> Void) {
        let session = URLSession.shared
        let location = UserDefaults.standard.object(forKey: STRING.CityNameKey)!

        let urlString =
        "https://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=\(API.key)"

        guard let url = URL(string: urlString) else {
            completion(.failure(.inValidURL))
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(.cannotProcessData))
                return
            }
            guard response is HTTPURLResponse else{
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.dataNotAvailable))
                return
            }
            let decoder = JSONDecoder()
            do {
                let currentDay = try? decoder.decode(CurrentDayWeatherData.self, from: data)
                if((currentDay == nil)){
                    completion(.failure(.cannotProcessData))
                    return
                }
                completion(.success(currentDay!))
            } catch {
                completion(.failure(.cannotProcessData))
            }
        }
        task.resume()
    }
    
    private init() {}
}

