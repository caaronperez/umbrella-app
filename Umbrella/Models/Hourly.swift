//
//  Hourly.swift
//  Umbrella
//
//  Created by MCS Devices on 11/6/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class Hourly: NSObject {
    
    var currentHour: Hour?
    var todayHours: [Hour]? = []
    var tomorrowHours: [Hour]? = []
    var parsed: Bool = false
    
    static func parsePostArray(postArray: [[String:Any]]) -> Hourly{
        let hourly = Hourly()
        
        for hour in postArray {
            
            let hourParsed = Hour.parsePostArray(postArray: hour)
            let date = Date()
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
            
            let day = "\(components.day!)"
            let tomorrow = "\(components.day! + 1)"
            let hour = "\(components.hour!)"
            
            if hourParsed.mday.contains(find: day){
                hourly.todayHours?.append(hourParsed) 
            } else if hourParsed.mday.contains(find: tomorrow){
                hourly.tomorrowHours?.append(hourParsed)
            }
            
            if hourParsed.hour.contains(find: hour) {
                hourly.currentHour = hourParsed
            }
        }
        
        if hourly.todayHours?.count != 0 && hourly.tomorrowHours?.count != 0 {
            hourly.parsed = true
        }
        
        return hourly
    }
}
