//
//  Extension.swift
//  POC-Hotel-Concept
//
//  Created by Waiphyoag on 9/6/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import Foundation
import UIKit
extension UITableView {
    
    // cell register
    
    func registerForCell(strID : String)  {
        
        register(UINib(nibName: strID, bundle: nil), forCellReuseIdentifier: strID)
    }
}
