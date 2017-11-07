//
//  Current.swift
//  Umbrella
//
//  Created by MCS Devices on 11/6/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class Current: NSObject {
    
    var currentTemp: [String: String], city: String, weather: String, icon: String
    
    override init(){
        self.currentTemp = ["":""]
        self.city = ""
        self.weather = ""
        self.icon = ""
    }
    
    init(currentTemp: [String: String], city: String, weather: String, icon: String){
        self.currentTemp = currentTemp
        self.city = city
        self.weather = weather
        self.icon = icon
    }
    
    static func parsePostArray(postArray: [String:Any]) -> Current{
        let display_location = postArray[WeatherAPI.display_location] as! [String:Any]
        
        if let temp_f = postArray[WeatherAPI.temp_f], let temp_c = postArray[WeatherAPI.temp_c], let weather = postArray[WeatherAPI.weather], let icon = postArray[WeatherAPI.icon]{
            return Current(currentTemp: ["english": "\(temp_f)", "metric": "\(temp_c)"], city: display_location[WeatherAPI.full] as! String, weather: weather as! String, icon: icon as! String)
        }else{
            return Current()
        }
    }
}
