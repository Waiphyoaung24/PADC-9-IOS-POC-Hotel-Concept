//
//  BottomSheetViewController.swift
//  POC-Hotel-Concept
//
//  Created by Waiphyoag on 9/6/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import UIKit

class BottomSheetViewController: UIViewController {

    @IBOutlet weak var viewSortBy: UIView!
    @IBOutlet weak var viewNone: UIView!
    @IBOutlet weak var viewR1: UIView!
    @IBOutlet weak var viewR2: UIView!
    @IBOutlet weak var viewR3: UIView!
    @IBOutlet weak var viewR4: UIView!
    @IBOutlet weak var viewR5: UIView!
    
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var btnMap: UIButton!
    
    @IBInspectable var cornerRadius: CGFloat = 2
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor = UIColor.white
    @IBInspectable var shadowOpacity: Float = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewSortBy.layer.borderWidth = 1
        viewSortBy.layer.borderColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        viewSortBy.layer.cornerRadius = 10
        viewSortBy.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        BorderTextView(viewNone)
        BorderTextView(viewR1)
        BorderTextView(viewR2)
        BorderTextView(viewR3)
        BorderTextView(viewR4)
        BorderTextView(viewR5)
        
        btnFilter.layer.cornerRadius = 5
        btnFilter.layer.shadowColor = shadowColor.cgColor
        btnFilter.layer.shadowOffset = CGSize(width:  shadowOffsetWidth, height: shadowOffsetHeight)
        btnFilter.layer.shadowOpacity = shadowOpacity
        
        
        btnMap.layer.shadowColor = shadowColor.cgColor
        btnMap.layer.shadowOffset = CGSize(width:  shadowOffsetWidth, height: shadowOffsetHeight)
        btnMap.layer.shadowOpacity = shadowOpacity
        btnMap.layer.cornerRadius = 5

       
    }
    func BorderTextView(_ view : UIView) {
       view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        
    }
    static func instantiate() -> BottomSheetViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BottomSheetViewController") as! BottomSheetViewController
    }
    

  

}
