//
//  ExploreViewController.swift
//  POC-Hotel-Concept
//
//  Created by Waiphyoag on 9/5/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import UIKit
import FittedSheets

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var cvFilter: CardView!
    @IBOutlet weak var btnMap: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var viewLocation: UIView!
    @IBOutlet weak var viewcheckIn: UIView!
    @IBOutlet weak var viewCheckOut: UIView!
    @IBOutlet weak var viewCount: UIView!
    @IBOutlet weak var viewRooms: UIView!
    
    @IBInspectable var cornerRadius: CGFloat = 2
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor = UIColor.white
    @IBInspectable var shadowOpacity: Float = 0.5
    
    let numberOfItemsPerRow : CGFloat = 1
    let spacing : CGFloat = 20
    
    @IBOutlet weak var collectionSearchList: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        
        // Do any additional setup after loading the view.
        viewLocation.layer.borderWidth = 1
        viewLocation.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        viewcheckIn.layer.borderWidth = 1
        viewcheckIn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        viewCheckOut.layer.borderWidth = 1
        viewCheckOut.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        viewCount.layer.borderWidth = 1
        viewCount.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        viewRooms.layer.borderWidth = 1
        viewRooms.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        btnSearch.layer.cornerRadius = 5
        btnSearch.layer.shadowColor = shadowColor.cgColor
        btnSearch.layer.shadowOffset = CGSize(width:  shadowOffsetWidth, height: shadowOffsetHeight)
        btnSearch.layer.shadowOpacity = shadowOpacity
        
        
        btnMap.layer.shadowColor = shadowColor.cgColor
        btnMap.layer.shadowOffset = CGSize(width:  shadowOffsetWidth, height: shadowOffsetHeight)
        btnMap.layer.shadowOpacity = shadowOpacity
        btnMap.layer.cornerRadius = 5
        
        
        collectionSearchList.delegate = self
        collectionSearchList.dataSource = self
        
        let nibForHeader = UINib(nibName: String(describing: HeaderCollectionReusableView.self), bundle: nil)
        collectionSearchList.register(nibForHeader, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: HeaderCollectionReusableView.self))
        
        let nib = UINib(nibName: String(describing: SearchListCollectionViewCell.self), bundle: nil)
        collectionSearchList.register(nib, forCellWithReuseIdentifier: String(describing: SearchListCollectionViewCell.self))
        
        
        let layout = collectionSearchList.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width:self.view.frame.width - 10 , height: 250)
        

        
        let gesture = UITapGestureRecognizer(target: self, action: #selector (filter (_:)))
            cvFilter.addGestureRecognizer(gesture)
        
    }
    @objc func filter( _ sender : UITapGestureRecognizer) {
        
        let controller = BottomSheetViewController.instantiate()
        
        let sheetController = SheetViewController(controller: controller, sizes: [.fixed(650), .halfScreen])
        
        // Adjust how the bottom safe area is handled on iPhone X screens
        sheetController.blurBottomSafeArea = false
        sheetController.adjustForBottomSafeArea = true
        
        // Turn off rounded corners
        sheetController.topCornersRadius = 0
        
        // Make corners more round
        sheetController.topCornersRadius = 15
        
        // Disable the dismiss on background tap functionality
        sheetController.dismissOnBackgroundTap = false
        
        // Extend the background behind the pull bar instead of having it transparent
        sheetController.extendBackgroundBehindHandle = true
        
        // Change the overlay color

        // Change the handle color
        sheetController.handleColor = UIColor.white
        
        self.present(sheetController, animated: false, completion: nil)
        
        
    }
    
    
    
    
}

extension ExploreViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SearchListCollectionViewCell.self), for: indexPath) as! SearchListCollectionViewCell
        return item
        
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    
    
    
}
extension ExploreViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: HeaderCollectionReusableView.self), for: indexPath) as! HeaderCollectionReusableView
        
        let category = indexPath.section == 0 ? "Top Searches": "Recent Searches"
        sectionHeader.mData = category
        return sectionHeader
    }
    
}
