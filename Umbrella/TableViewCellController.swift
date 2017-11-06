//
//  TableViewCellController.swift
//  Umbrella
//
//  Created by MCS Devices on 11/5/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class TableViewCellController: UITableViewCell {

    @IBOutlet weak var hoursCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        hoursCollection.delegate = self
        hoursCollection.dataSource = self
        hoursCollection.register(UINib(nibName: CollectionViewCellController.nibName, bundle: nil), forCellWithReuseIdentifier: CollectionViewCellController.nibName)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TableViewCellController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellController.nibName, for: indexPath) as! CollectionViewCellController
        return view
    }
    
    
}
