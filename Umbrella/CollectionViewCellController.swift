//
//  CollectionViewCellController.swift
//  Umbrella
//
//  Created by MCS Devices on 11/5/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class CollectionViewCellController: UICollectionViewCell {

    static let nibName = "CollectionViewCellController"
    
    @IBOutlet weak var civilLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
