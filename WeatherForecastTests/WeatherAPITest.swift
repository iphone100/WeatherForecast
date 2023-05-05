//
//  WeatherAPITest.swift
//  WeatherForecastTests
//
//  Created by Ramanathan, Sathish Kumar (Cognizant) on 04/05/23.
//

import XCTest
@testable import WeatherForecast

final class WeatherAPITest: XCTestCase {

    var session: URLSession!

    override func setUpWithError() throws {
      try super.setUpWithError()
        session = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
        session = nil
      try super.tearDownWithError()
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidApiCallGetsHTTPStatusCode200() throws {
        // given
        let location = UserDefaults.standard.object(forKey: STRING.CityNameKey)!
        let urlString =
        "https://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=\(API.key)"
        
        let url = URL(string: urlString)!
        // 1
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = session.dataTask(with: url) { _, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 5)
    }
}
