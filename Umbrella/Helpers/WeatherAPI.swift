//
//  oMDBAPI.swift
//  GoT
//
//  Created by MCS Devices on 10/26/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import Foundation

final class oMDBAPI{
    
    static let APIKey = "5f42f87a0bb800e1"
    static let endPoint = "http://api.wunderground.com/api/\(APIKey)/"
    static let zipCode = "30303"
    static let hourlyEndpoint = "hourly/q/\(zipCode).json"
    static let conditionsEndpoint = "conditions/q/\(zipCode).json"
    
    // Season Endpoint Dictionary Keys
    static let hour = "hour"
    static let min = "min"
    static let year = "year"
    static let mon = "mon"
    static let mon_abbrev = "mon_abbrev"
    static let mday = "mday"
    static let mday_padded = "mday_padded"
    static let yday = "yday"
    static let pretty = "pretty"
    static let civil = "civil"
    static let month_name = "month_name"
    static let month_name_abbrev = "month_name_abbrev"
    static let weekday_name = "weekday_name"
    static let ampm = "ampm"
    static let temp = "temp"
    static let english = "english"
    static let metric = "metric"
    static let dewpoint = "dewpoint"
    static let condition = "condition"
    static let icon = "icon"
    static let sky = "sky"
    static let wdir = "wdir"
    static let feelslike = "feelslike"
    
    // SEASON Endpoint Current Keys
    static let display_location = "Title"
    static let full = "Season"
    static let country = "Episodes"
    static let zip = "Title"
    static let latitude = "Season"
    static let longitude = "Episodes"
    static let observation_time = "Title"
    static let weather = "Season"
    static let temperature_string = "Episodes"
    static let temp_f = "Title"
    static let temp_c = "Season"
    static let relative_humidity = "Episodes"
    static let wind_string = "Title"
    static let wind_degrees = "Season"
    static let wind_mph = "Episodes"
    static let wind_kph = "Title"
    static let pressure_mb = "Season"
    static let feelslike_string = "Episodes"
    static let visibility_km = "Title"
    static let UV = "Season"
    static let precip_today_in = "Episodes"
    static let precip_today_metric = "Episodes"
    static let icon = "Episodes"
    
}

