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

/*protocol NetworkManagerDelegateSerie: class {
    func didDownloadPost(postArray: Serie)
}

protocol NetworkManagerDelegateSeason: class {
    func didDownloadPost(postArray: Season)
}

protocol NetworkManagerDelegateChapter: class {
    func didDownloadPost(postArray: Chapter)
}

protocol NetworkManagerImage: class {
    func didDownloadImage(image: UIImage)
}*/
