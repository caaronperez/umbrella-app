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
    
    // Hourly Endpoint Dictionary Keys
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
    
    // Current Endpoint Dictionary Keys
    static let display_location = "display_location"
    static let full = "full"
    static let country = "country"
    static let zip = "zip"
    static let latitude = "latitude"
    static let longitude = "longitude"
    static let observation_time = "observation_time"
    static let weather = "weather"
    static let temperature_string = "temperature_string"
    static let temp_f = "temp_f"
    static let temp_c = "temp_c"
    static let relative_humidity = "relative_humidity"
    static let wind_string = "wind_string"
    static let wind_degrees = "wind_degrees"
    static let wind_mph = "wind_mph"
    static let wind_kph = "wind_kph"
    static let pressure_mb = "pressure_mb"
    static let feelslike_string = "feelslike_string"
    static let visibility_km = "visibility_km"
    static let UV = "UV"
    static let precip_today_in = "precip_today_in"
    static let precip_today_metric = "precip_today_metric"
}

