//
//  NetworkManager.swift
//  TableViewNetworking
//
//  Created by Adolfo on 8/10/17.
//  Copyright © 2017 AdolfoGarza. All rights reserved.
//

import Foundation

class NetworkManager {
    
    var delegateHourly: NetworkManagerDelegateHourly?
    var delegateCurrent: NetworkManagerDelegateCurrent?
    var delegateAlert: NetworkManagerDelegateAlert?
  
    func downloadAPIPost(type: String){
        let urlString = URL(string: "\(WeatherAPI.endPoint)\(type)")
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                if error != nil {
                    print(error as Any)
                } else {
                    do {
                        if let jsonArray = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] {
                            DispatchQueue.main.async {
                                if jsonArray["response"] == nil{
                                    print("Error ocurred")
                                }else{
                                    if(type.containsIgnoringCase(find: "hourly")){
                                        if jsonArray["hourly_forecast"] != nil, jsonArray["current_observation"] != nil {
                                            let result = Hourly.parsePostArray(postArray: jsonArray["hourly_forecast"] as! [[String : Any]])
                                            self?.delegateHourly?.didDownloadPost(postArray: result)
                                     
                                            let result2 = Current.parsePostArray(postArray: jsonArray["current_observation"] as! [String : Any])
                                            self?.delegateCurrent?.didDownloadPost(postArray: result2)
                                        }else {
                                            self?.delegateAlert?.showAlert()
                                        }
                                    }
                                }
                            }
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            task.resume()
        }
    }
}
