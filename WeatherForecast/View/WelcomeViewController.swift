//
//  WelcomeViewController.swift
//  WeatherForecast
//
//  Created by Ramanathan, Sathish Kumar (Cognizant) on 04/05/23.
//

import UIKit
import CoreLocation

public class WelcomeViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var txtCityName: UITextField!
    @IBOutlet weak var btnFetchDetails: UIButton!
    
    let manager = CLLocationManager()

    //MARK: ViewController LifeCycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureNavigation()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let cityName = UserDefaults.standard.object(forKey: STRING.CityNameKey) as? String
        self.txtCityName.text = cityName
    }
    
    //MARK: Configure Location
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
    }
    
    //MARK: Navigation Title
    func configureNavigation()  {
        self.navigationItem.title = STRING.NavTitleForecast
        self.navigationController?.navigationBar.barTintColor = .systemGreen
        self.navigationController?.navigationBar.backgroundColor = .systemMint
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: STRING.VerdanaBoldFont, size: 17)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
    }
    
    //MARK: Button Action
    //Fetch the weather details
    @IBAction func FetchDetails(_ sender: Any) {
        self.view.endEditing(true)
        if let cityName = self.txtCityName.text {
            if cityName.count > 0 {
                UserDefaults.standard.set(cityName, forKey: STRING.CityNameKey)
                UserDefaults.standard.synchronize()
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: STRING.WeatherDetailsVC) as! WeatherDetailsViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else{
                self.showAlertWithTitleMessage(title: STRING.Sorry, message: STRING.EnterCityName)
                self.txtCityName.text = ""
            }
        }
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


