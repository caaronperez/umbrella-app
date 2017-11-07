//
//  NetworkManagerDelegate.swift
//  TableViewNetworking
//
//  Created by Adolfo on 8/10/17.
//  Copyright © 2017 AdolfoGarza. All rights reserved.
//

import Foundation

protocol NetworkManagerDelegate: class {
    func didDownloadPost(postArray: [String: Any])
}

protocol NetworkManagerDelegateHourly: class {
    func didDownloadPost(postArray: Hourly)
}

protocol NetworkManagerDelegateCurrent: class {
    func didDownloadPost(postArray: Current)
}

/*protocol NetworkManagerDelegateChapter: class {
    func didDownloadPost(postArray: Chapter)
}

protocol NetworkManagerImage: class {
    func didDownloadImage(image: UIImage)
}*/
