//
//  ViewController.swift
//  Umbrella
//
//  Created by MCS Devices on 11/5/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var currentIcon: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var currentUnit: UILabel!
    @IBOutlet weak var currentZipLabel: UILabel!
    
    var hourlyWeather: Hourly!
    var currentWeather: Current!
    var zipCode: String! = "30030"
    var local: String! = "english"
    var networkRequests: [Any?] = []
    var delegateHourly:NetworkManagerDelegateHourly?
    var delegateCurrent:NetworkManagerDelegateCurrent?
    var delegateAlert:NetworkManagerDelegateAlert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        initValues()
        executeNetworkCalls()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTable() {
        tableView.rowHeight = 170
    }
    
    func initValues() {
        currentZipLabel.text = zipCode
        currentUnit.text = (local == "english") ? "Fº" : "Cº"
        self.title = "Home"
    }
    
    func executeNetworkCalls(){
        let hourlyType = "\(WeatherAPI.hourlyEndpoint)\(WeatherAPI.conditionsEndpoint)q/\(self.zipCode as String)\(WeatherAPI.jsonFormat)"
        let myNetworkManager = NetworkManager()
        networkRequests.append(myNetworkManager)
        myNetworkManager.delegateHourly = self
        myNetworkManager.delegateCurrent = self
        myNetworkManager.delegateAlert = self
        myNetworkManager.downloadAPIPost(type: hourlyType)
    }
}


extension ViewController {
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
        if let source = sender.source as? SettingsController {
            if source.zip != nil && source.units != nil {
                self.zipCode = source.zip as String
                if zipCode.count == 5 {
                    if source.units == "Fahrenheit" {
                        self.local = "english"
                        viewDidLoad()
                    }else {
                        self.local = "metric"
                        viewDidLoad()
                    }
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        let time: UILabel = cell.viewWithTag(10) as! UILabel
        time.text = (indexPath.row == 0) ? "Today" : "Tomorrow"
        cell.dropShadow()
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? TableViewCellController else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if hourlyWeather != nil {
            if collectionView.tag == 0 {
                if let rowHours = hourlyWeather.todayHours?.count {
                    return rowHours as Int
                } else {
                    return 0
                }
                
            } else {
                if let rowHours = hourlyWeather.tomorrowHours?.count {
                    return rowHours as Int
                } else {
                    return 0
                }
            }
        
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        if hourlyWeather != nil {
            if collectionView.tag == 0 {
               
                let image: UIImageView = cell.viewWithTag(20) as! UIImageView
                image.image = UIImage(named: hourlyWeather.todayHours![indexPath.row].icon)
                
                let time: UILabel = cell.viewWithTag(10) as! UILabel
                time.text = hourlyWeather.todayHours![indexPath.row].civil
                
                (Int(hourlyWeather.todayHours![indexPath.row].hour)! >= 6 && Int(hourlyWeather.todayHours![indexPath.row].hour)! < 18) ? image.tintImageColor(color: UIColor.orange) : image.tintImageColor(color: UIColor.blue)
                
                let current: UILabel = cell.viewWithTag(30) as! UILabel
                current.text = "\(hourlyWeather.todayHours![indexPath.row].temp[local]!) º"
                
            } else {
                
                let image: UIImageView = cell.viewWithTag(20) as! UIImageView
                image.image = UIImage(named: hourlyWeather.tomorrowHours![indexPath.row].icon)
                
                let time: UILabel = cell.viewWithTag(10) as! UILabel
                time.text = hourlyWeather.tomorrowHours![indexPath.row].civil
                
                (Int(hourlyWeather.tomorrowHours![indexPath.row].hour)! >= 6 && Int(hourlyWeather.tomorrowHours![indexPath.row].hour)! < 18) ? image.tintImageColor(color: UIColor.orange) : image.tintImageColor(color: UIColor.blue)
                
                let current: UILabel = cell.viewWithTag(30) as! UILabel
                current.text = "\(hourlyWeather.tomorrowHours![indexPath.row].temp[local]!) º"
            }
        }
        return cell
    }
}

extension ViewController: NetworkManagerDelegateAlert {
    func showAlert() {
        let alertController = UIAlertController(title: "Error!", message: "We couldn't find your location", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
}

extension ViewController: NetworkManagerDelegateHourly {
    func didDownloadPost(postArray: Hourly) {
        hourlyWeather = postArray
        tableView.reloadData()
    }
}

extension ViewController: NetworkManagerDelegateCurrent {
    func didDownloadPost(postArray: Current) {
        
        currentWeather = postArray
        degreeLabel.text = "\(currentWeather.currentTemp[local]!.floatValue.cleanValue)º"
        locationLabel.text = currentWeather.city
        currentLabel.text = currentWeather.weather
        currentIcon.image = UIImage(named: currentWeather.icon)
        currentIcon.tintImageColor(color: UIColor.white)
    
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
        let hour = components.hour
        
        if hour! >= 6 && hour! < 18 {
            backgroundImage.image = #imageLiteral(resourceName: "cloudly")
            backgroundImage.dropShadow(color: .gray, opacity: 0.8, offSet: CGSize(width: -1, height: 1), radius: 5, scale: true)
        }else {
            backgroundImage.image = #imageLiteral(resourceName: "nightly")
            backgroundImage.dropShadow(color: .gray, opacity: 0.9, offSet: CGSize(width: -2, height: 2), radius: 5, scale: true)
        }
        
    }
}
