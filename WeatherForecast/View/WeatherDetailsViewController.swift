//
//  WeatherDetailsViewController.swift
//  WeatherForecast
//
//  Created by Ramanathan, Sathish Kumar (Cognizant) on 04/05/23.
//

import UIKit

class WeatherDetailsViewController: UIViewController, DataDelegate {
    
    @IBOutlet weak var currentWeather: UILabel!
    @IBOutlet weak var currentWeatherMin: UILabel!
    @IBOutlet weak var currentWeatherMax: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
   
    //MARK: Render UI Data
    func fetchCurrentDayData(_ data: CurrentDayWeatherData) {
        self.details = data
        print(self.details as Any)
        self.currentWeatherMin.text = "\(Int(details!.main.tempmin))˚"
        self.currentWeatherMax.text = "\(Int(details!.main.tempmax))˚"
        switch  details!.weather[0].main {
        case STRING.Clouds:
            self.navigationItem.title = STRING.Cloudy
            self.currentWeatherImage.image = UIImage(named: STRING.Cloudy)
        case STRING.Mist:
            self.navigationItem.title = STRING.Mist
            self.currentWeatherImage.image = UIImage(named: STRING.Rainy)
        case STRING.Rain:
            self.navigationItem.title = STRING.Rainy
            self.currentWeatherImage.image = UIImage(named: STRING.Rainy)
        case STRING.Clear:
            self.navigationItem.title = STRING.Sunny
            self.currentWeatherImage.image = UIImage(named: STRING.Sunny)
        case STRING.Thunderstorm:
            self.navigationItem.title = STRING.Thunderstorm
            self.currentWeatherImage.image = UIImage(named: STRING.Thunder)
        default:
            self.navigationItem.title = STRING.Weather
            self.currentWeatherImage.image = UIImage(named: STRING.Sunny)
            return
        }
    }
    
    func fetchCurrentDayError(_ error: UserError) {
        self.navigationItem.title = STRING.NavTitleError
        self.showAlertWithTitleMessage(title: STRING.Sorry, message: error.localizedDescription)
    }
    
    //MARK: WeatherDetails ViewModel
    var viewModel = WeatherDetailsViewModel()
    var details : CurrentDayWeatherData?
   
    //MARK: ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.delegate = self
        viewModel.fetchCurrentDayData()
    }
    
    //MARK: Alert
    func showAlertWithTitleMessage(title:String, message: String) {
        let alert = UIAlertController(title: STRING.AlertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: STRING.OkTitle, style: .default, handler: { action in
            switch action.style{
            case .default:
                print(STRING.Default)
                
            case .cancel:
                print(STRING.Cancel)
                
            case .destructive:
                print(STRING.Destructive)
                
            @unknown default:
                break
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
