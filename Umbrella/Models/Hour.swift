//
//  Hour.swift
//  Umbrella
//
//  Created by MCS Devices on 11/6/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class Hour: NSObject {
    
    var hour: String, min: String, year: String, mon: String, mon_abbrev: String, mday: String, mday_padded: String, yday: String, pretty: String, civil: String, month_name: String, month_name_abbrev: String, weekday_name: String, ampm: String, temp: [String: String], condition: String, icon: String, sky: String, snow: [String: String], parsed: Bool;
    
    
    init(hour: String, min: String, year: String, mon: String, mon_abbrev: String, mday: String, mday_padded: String, yday: String, pretty: String, civil: String, month_name: String, month_name_abbrev: String, weekday_name: String, ampm: String, temp: [String: String], condition: String, icon: String, sky: String, snow: [String: String], parsed: Bool){
        self.hour = hour
        self.min = min
        self.year = year
        self.mon = mon
        self.mon_abbrev = mon_abbrev
        self.mday = mday
        self.yday = yday
        self.mday_padded = mday_padded
        self.pretty = pretty
        self.civil = civil
        self.month_name = month_name
        self.month_name_abbrev = month_name_abbrev
        self.weekday_name = weekday_name
        self.ampm = ampm
        self.temp = temp
        self.condition = condition
        self.icon = icon
        self.sky = sky
        self.snow = snow
        self.parsed = parsed
    }
    
    override init(){
        self.hour = "hour"
        self.min = "min"
        self.year = "year"
        self.mon = "mon"
        self.mon_abbrev = "mon_abbrev"
        self.mday = "mday"
        self.yday = "yday"
        self.mday_padded = "mday_padded"
        self.pretty = "pretty"
        self.civil = "civil"
        self.month_name = "month_name"
        self.month_name_abbrev = "month_name_abbrev"
        self.weekday_name = "weekday_name"
        self.ampm = "ampm"
        self.temp = ["metric": "0", "english": "0"]
        self.condition = "condition"
        self.icon = "icon"
        self.sky = "sky"
        self.snow = ["metric": "0", "english": "0"]
        self.parsed = false
    }
    
    static func parsePostArray(postArray: [String:Any]) -> Hour{
        let fctime = postArray[WeatherAPI.FCTTIME] as! [String:Any]
        let temp = postArray[WeatherAPI.temp] as! [String:Any]
        let snow = postArray[WeatherAPI.snow] as! [String:Any]
        
        if let hour = fctime[WeatherAPI.hour], let min = fctime[WeatherAPI.min], let year = fctime[WeatherAPI.year], let mon = fctime[WeatherAPI.mon], let mon_abbrev = fctime[WeatherAPI.mon_abbrev], let mday = fctime[WeatherAPI.mday], let yday = fctime[WeatherAPI.yday], let mday_padded = fctime[WeatherAPI.mday_padded], let pretty = fctime[WeatherAPI.pretty], let civil = fctime[WeatherAPI.civil], let month_name = fctime[WeatherAPI.month_name], let month_name_abbrev = fctime[WeatherAPI.month_name_abbrev], let weekday_name = fctime[WeatherAPI.weekday_name], let ampm = fctime[WeatherAPI.ampm], let condition = postArray[WeatherAPI.condition], let icon = postArray[WeatherAPI.icon], let sky = postArray[WeatherAPI.sky]{
        
            return Hour(hour: hour as! String, min: min as! String, year: year as! String, mon: mon as! String, mon_abbrev: mon_abbrev as! String, mday: mday as! String, mday_padded: mday_padded as! String, yday: yday as! String, pretty: pretty as! String, civil: civil as! String, month_name: month_name as! String, month_name_abbrev: month_name_abbrev as! String, weekday_name: weekday_name as! String, ampm: ampm as! String, temp: temp as! [String: String], condition: condition as! String, icon: icon as! String, sky: sky as! String, snow: snow as! [String: String], parsed: true)
        }else{
            return Hour()
        }
    }
}
