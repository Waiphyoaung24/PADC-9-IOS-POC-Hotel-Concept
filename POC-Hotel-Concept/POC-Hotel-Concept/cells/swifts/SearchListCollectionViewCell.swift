//
//  SearchListCollectionViewCell.swift
//  POC-Hotel-Concept
//
//  Created by Waiphyoag on 9/6/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import UIKit

class SearchListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionViewSearchItem: UICollectionView!
    
    let numberOfItemsPerRow : CGFloat = 1.5
    let spacing : CGFloat = 20
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionViewSearchItem.delegate = self
        collectionViewSearchItem.dataSource = self
        let nib = UINib(nibName: String(describing: SearchItemCollectionViewCell.self), bundle: nil)
        collectionViewSearchItem.register(nib, forCellWithReuseIdentifier: String(describing: SearchItemCollectionViewCell.self))
        
      
        let layout = collectionViewSearchItem.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 320, height: 200)
        
        
    }

}

extension SearchListCollectionViewCell : UICollectionViewDelegate {
    
}
extension SearchListCollectionViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SearchItemCollectionViewCell.self), for: indexPath)
        as! SearchItemCollectionViewCell
            return item
    }
    
    
}
