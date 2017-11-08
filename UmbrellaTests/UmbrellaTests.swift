//
//  UmbrellaTests.swift
//  UmbrellaTests
//
//  Created by MCS Devices on 11/5/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import XCTest
@testable import Umbrella

class UmbrellaTests: XCTestCase {
    
    var hour: Hour?
    var hourly: Hourly?
    var current: Current?
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHourParser(){
        hour = Hour.parsePostArray(postArray: hourDictionary)
        XCTAssertTrue((hour?.parsed)!, "Parser Fail");
    }
    
    func testHourlyParser(){
        hourly = Hourly.parsePostArray(postArray: hourlyDictionary)
        XCTAssertTrue((hourly?.parsed)!, "Parser Fail");
    }
    
    func testCurrentParser(){
        current = Current.parsePostArray(postArray: currentDictionary)
        XCTAssertTrue((current?.parsed)!, "Parsed Fail");
    }
    
    func testExample() {
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
    var hourDictionary = [
        "FCTTIME": [
            "hour": "8",
            "hour_padded": "08",
            "min": "00",
            "min_unpadded": "0",
            "sec": "0",
            "year": "2017",
            "mon": "11",
            "mon_padded": "11",
            "mon_abbrev": "Nov",
            "mday": "7",
            "mday_padded": "07",
            "yday": "310",
            "isdst": "0",
            "epoch": "1510059600",
            "pretty": "8:00 AM EST on November 07, 2017",
            "civil": "8:00 AM",
            "month_name": "November",
            "month_name_abbrev": "Nov",
            "weekday_name": "Tuesday",
            "weekday_name_night": "Tuesday Night",
            "weekday_name_abbrev": "Tue",
            "weekday_name_unlang": "Tuesday",
            "weekday_name_night_unlang": "Tuesday Night",
            "ampm": "AM",
            "tz": "",
            "age": "",
            "UTCDATE": ""
        ],
        "temp": [
        "english": "66",
        "metric": "19"
        ],
        "dewpoint": [
        "english": "63",
        "metric": "17"
        ],
        "condition": "Overcast",
        "icon": "cloudy",
        "icon_url": "http://icons.wxug.com/i/c/k/cloudy.gif",
        "fctcode": "4",
        "sky": "91",
        "wspd": [
        "english": "4",
        "metric": "6"
        ],
        "wdir": [
        "dir": "SW",
        "degrees": "225"
        ],
        "wx": "Cloudy",
        "uvi": "0",
        "humidity": "90",
        "windchill": [
        "english": "-9999",
        "metric": "-9999"
        ],
        "heatindex": [
        "english": "-9999",
        "metric": "-9999"
        ],
        "feelslike": [
        "english": "66",
        "metric": "19"
        ],
        "qpf": [
        "english": "0.0",
        "metric": "0"
        ],
        "snow": [
        "english": "0.0",
        "metric": "0"
        ],
        "pop": "15",
        "mslp": [
        "english": "30.05",
        "metric": "1018"
        ]
        ] as [String : Any]
    
    
    var hourlyDictionary = [
    [
        "FCTTIME": [
            "hour": "8",
            "hour_padded": "08",
            "min": "00",
            "min_unpadded": "0",
            "sec": "0",
            "year": "2017",
            "mon": "11",
            "mon_padded": "11",
            "mon_abbrev": "Nov",
            "mday": "7",
            "mday_padded": "07",
            "yday": "310",
            "isdst": "0",
            "epoch": "1510059600",
            "pretty": "8:00 AM EST on November 07, 2017",
            "civil": "8:00 AM",
            "month_name": "November",
            "month_name_abbrev": "Nov",
            "weekday_name": "Tuesday",
            "weekday_name_night": "Tuesday Night",
            "weekday_name_abbrev": "Tue",
            "weekday_name_unlang": "Tuesday",
            "weekday_name_night_unlang": "Tuesday Night",
            "ampm": "AM",
            "tz": "",
            "age": "",
            "UTCDATE": ""
        ],
        "temp": [
            "english": "66",
            "metric": "19"
        ],
        "dewpoint": [
            "english": "63",
            "metric": "17"
        ],
        "condition": "Overcast",
        "icon": "cloudy",
        "icon_url": "http://icons.wxug.com/i/c/k/cloudy.gif",
        "fctcode": "4",
        "sky": "91",
        "wspd": [
            "english": "4",
            "metric": "6"
        ],
        "wdir": [
            "dir": "SW",
            "degrees": "225"
        ],
        "wx": "Cloudy",
        "uvi": "0",
        "humidity": "90",
        "windchill": [
            "english": "-9999",
            "metric": "-9999"
        ],
        "heatindex": [
            "english": "-9999",
            "metric": "-9999"
        ],
        "feelslike": [
            "english": "66",
            "metric": "19"
        ],
        "qpf": [
            "english": "0.0",
            "metric": "0"
        ],
        "snow": [
            "english": "0.0",
            "metric": "0"
        ],
        "pop": "15",
        "mslp": [
            "english": "30.05",
            "metric": "1018"
        ]
        ],
    [
        "FCTTIME": [
            "hour": "9",
            "hour_padded": "09",
            "min": "00",
            "min_unpadded": "0",
            "sec": "0",
            "year": "2017",
            "mon": "11",
            "mon_padded": "11",
            "mon_abbrev": "Nov",
            "mday": "7",
            "mday_padded": "07",
            "yday": "310",
            "isdst": "0",
            "epoch": "1510063200",
            "pretty": "9:00 AM EST on November 07, 2017",
            "civil": "9:00 AM",
            "month_name": "November",
            "month_name_abbrev": "Nov",
            "weekday_name": "Tuesday",
            "weekday_name_night": "Tuesday Night",
            "weekday_name_abbrev": "Tue",
            "weekday_name_unlang": "Tuesday",
            "weekday_name_night_unlang": "Tuesday Night",
            "ampm": "AM",
            "tz": "",
            "age": "",
            "UTCDATE": ""
        ],
        "temp": [
            "english": "67",
            "metric": "19"
        ],
        "dewpoint": [
            "english": "64",
            "metric": "18"
        ],
        "condition": "Overcast",
        "icon": "cloudy",
        "icon_url": "http://icons.wxug.com/i/c/k/cloudy.gif",
        "fctcode": "4",
        "sky": "90",
        "wspd": [
            "english": "5",
            "metric": "8"
        ],
        "wdir": [
            "dir": "SW",
            "degrees": "231"
        ],
        "wx": "Cloudy",
        "uvi": "0",
        "humidity": "90",
        "windchill": [
            "english": "-9999",
            "metric": "-9999"
        ],
        "heatindex": [
            "english": "-9999",
            "metric": "-9999"
        ],
        "feelslike": [
            "english": "67",
            "metric": "19"
        ],
        "qpf": [
            "english": "0.0",
            "metric": "0"
        ],
        "snow": [
            "english": "0.0",
            "metric": "0"
        ],
        "pop": "15",
        "mslp": [
            "english": "30.05",
            "metric": "1018"
        ]
        ],
    [
        "FCTTIME": [
            "hour": "2",
            "hour_padded": "02",
            "min": "00",
            "min_unpadded": "0",
            "sec": "0",
            "year": "2017",
            "mon": "11",
            "mon_padded": "11",
            "mon_abbrev": "Nov",
            "mday": "8",
            "mday_padded": "08",
            "yday": "311",
            "isdst": "0",
            "epoch": "1510124400",
            "pretty": "2:00 AM EST on November 08, 2017",
            "civil": "2:00 AM",
            "month_name": "November",
            "month_name_abbrev": "Nov",
            "weekday_name": "Wednesday",
            "weekday_name_night": "Wednesday Night",
            "weekday_name_abbrev": "Wed",
            "weekday_name_unlang": "Wednesday",
            "weekday_name_night_unlang": "Wednesday Night",
            "ampm": "AM",
            "tz": "",
            "age": "",
            "UTCDATE": ""
        ],
        "temp": [
            "english": "61",
            "metric": "16"
        ],
        "dewpoint": [
            "english": "60",
            "metric": "16"
        ],
        "condition": "Chance of Rain",
        "icon": "chancerain",
        "icon_url": "http://icons.wxug.com/i/c/k/nt_chancerain.gif",
        "fctcode": "12",
        "sky": "80",
        "wspd": [
            "english": "7",
            "metric": "11"
        ],
        "wdir": [
            "dir": "NW",
            "degrees": "310"
        ],
        "wx": "Few Showers",
        "uvi": "0",
        "humidity": "97",
        "windchill": [
            "english": "-9999",
            "metric": "-9999"
        ],
        "heatindex": [
            "english": "-9999",
            "metric": "-9999"
        ],
        "feelslike": [
            "english": "61",
            "metric": "16"
        ],
        "qpf": [
            "english": "0.01",
            "metric": "0"
        ],
        "snow": [
            "english": "0.0",
            "metric": "0"
        ],
        "pop": "32",
        "mslp": [
            "english": "30.0",
            "metric": "1016"
        ]
    ]
    ] as [[String: Any]]
    
    
    var currentDictionary =
    [ "image": [
        "url": "http://icons.wxug.com/graphics/wu2/logo_130x80.png",
        "title": "Weather Underground",
        "link": "http://www.wunderground.com"
    ],
    "display_location": [
    "full": "Atlanta, GA",
    "city": "Atlanta",
    "state": "GA",
    "state_name": "Georgia",
    "country": "US",
    "country_iso3166": "US",
    "zip": "30303",
    "magic": "1",
    "wmo": "99999",
    "latitude": "33.75000000",
    "longitude": "-84.38999939",
    "elevation": "308.2"
    ],
    "observation_location": [
    "full": "Castleberry Hill, Atlanta, Georgia",
    "city": "Castleberry Hill, Atlanta",
    "state": "Georgia",
    "country": "US",
    "country_iso3166": "US",
    "latitude": "33.750019",
    "longitude": "-84.400124",
    "elevation": "1057 ft"
    ],
    "estimated": [],
    "station_id": "KGAATLAN330",
    "observation_time": "Last Updated on November 7, 7:19 AM EST",
    "observation_time_rfc822": "Tue, 07 Nov 2017 07:19:24 -0500",
    "observation_epoch": "1510057164",
    "local_time_rfc822": "Tue, 07 Nov 2017 07:20:28 -0500",
    "local_epoch": "1510057228",
    "local_tz_short": "EST",
    "local_tz_long": "America/New_York",
    "local_tz_offset": "-0500",
    "weather": "Overcast",
    "temperature_string": "64.8 F (18.2 C)",
    "temp_f": 64.8,
    "temp_c": 18.2,
    "relative_humidity": "91%",
    "wind_string": "From the SSW at 4.0 MPH",
    "wind_dir": "SSW",
    "wind_degrees": 203,
    "wind_mph": 4,
    "wind_gust_mph": 0,
    "wind_kph": 6.4,
    "wind_gust_kph": 0,
    "pressure_mb": "1018",
    "pressure_in": "30.06",
    "pressure_trend": "-",
    "dewpoint_string": "62 F (17 C)",
    "dewpoint_f": 62,
    "dewpoint_c": 17,
    "heat_index_string": "NA",
    "heat_index_f": "NA",
    "heat_index_c": "NA",
    "windchill_string": "NA",
    "windchill_f": "NA",
    "windchill_c": "NA",
    "feelslike_string": "64.8 F (18.2 C)",
    "feelslike_f": "64.8",
    "feelslike_c": "18.2",
    "visibility_mi": "7.0",
    "visibility_km": "11.3",
    "solarradiation": "--",
    "UV": "0",
    "precip_1hr_string": "0.00 in ( 0 mm)",
    "precip_1hr_in": "0.00",
    "precip_1hr_metric": " 0",
    "precip_today_string": "0.00 in (0 mm)",
    "precip_today_in": "0.00",
    "precip_today_metric": "0",
    "icon": "cloudy",
    "icon_url": "http://icons.wxug.com/i/c/k/cloudy.gif",
    "forecast_url": "http://www.wunderground.com/US/GA/Atlanta.html",
    "history_url": "http://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID=KGAATLAN330",
    "ob_url": "http://www.wunderground.com/cgi-bin/findweather/getForecast?query=33.750019,-84.400124",
    "nowcast": ""
        ] as [String : Any]
    
}
