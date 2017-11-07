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
    //var image: NetworkManagerImage?
  
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
                                        let result = Hourly.parsePostArray(postArray: jsonArray["hourly_forecast"] as! [[String : Any]])
                                        self?.delegateHourly?.didDownloadPost(postArray: result)
                                 
                                        let result2 = Current.parsePostArray(postArray: jsonArray["current_observation"] as! [String : Any])
                                        self?.delegateCurrent?.didDownloadPost(postArray: result2)
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
    
    /*func getImage(imgUrl: String){
        
        let imgURL = URL(string: imgUrl)
        let task = URLSession.shared.dataTask(with: imgURL!) { [weak self] (data, response, error) in
            if error != nil {
                print(error as Any)
            } else {
                do  {
                    if let imgData =  data{  // conditional casting.
                        DispatchQueue.main.async { // calling the serial main queue to handle the display of information faster.
                            self?.image?.didDownloadImage(image: UIImage(data: imgData)!)
                        }
                        
                    }
                }
            }
        }
        task.resume()
    }*/
    
}

extension String {
    
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: String.CompareOptions.caseInsensitive) != nil
    }
}

