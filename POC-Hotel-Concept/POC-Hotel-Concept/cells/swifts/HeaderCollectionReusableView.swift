//
//  HeaderCollectionReusableView.swift
//  POC-Hotel-Concept
//
//  Created by Waiphyoag on 9/6/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var lblText: UILabel!
    
    var mData : String = ""
    {
        didSet {
            lblText.text = mData
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
