//
//  HomePageViewController.swift
//  POC-Hotel-Concept
//
//  Created by Waiphyoag on 9/5/19.
//  Copyright © 2019 Waiphyoag. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var tableViewLocation: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        ivProfile.layer.borderWidth = 1
        ivProfile.layer.masksToBounds = false
        ivProfile.layer.cornerRadius = ivProfile.frame.height/2
        ivProfile.clipsToBounds = true
        
        
        tableViewLocation.dataSource = self
        tableViewLocation.delegate = self
        let nib = UINib(nibName: String(describing: TripPlaceTableViewCell.self), bundle: nil)
        tableViewLocation.register(nib, forCellReuseIdentifier: String(describing: TripPlaceTableViewCell.self))
        
    }
    

   

}
extension HomePageViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TripPlaceTableViewCell.self), for: indexPath) as! TripPlaceTableViewCell
        return cell
    }
    
    
}
extension HomePageViewController : UITableViewDelegate {
    
}
