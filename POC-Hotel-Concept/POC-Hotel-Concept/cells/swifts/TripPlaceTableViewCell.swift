//
//  TripPlaceTableViewCell.swift
//  POC-Hotel-Concept
//
//  Created by Waiphyoag on 9/5/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import UIKit

class TripPlaceTableViewCell: UITableViewCell {


    @IBOutlet weak var ivTrip: UIImageView!
    @IBOutlet weak var cvTrip: CardView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

        selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
