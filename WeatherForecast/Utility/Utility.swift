//
//  Utility.swift
//  WeatherForecast
//
//  Created by Ramanathan, Sathish Kumar (Cognizant) on 04/05/23.
//

import UIKit

class Utility: NSObject {
    
    public private(set) var internetActive = false
    public private(set) var hostActive = false
    var tabEnabled = false
    
   static var myUtility: Utility?
    
    class func shared() -> Utility? {
        if myUtility == nil {
            myUtility = Utility()
        }
        return myUtility
    }
    
//Initializer access level change now
    private override init(){
        super.init()
  }

    
}
