//
//  ExploreViewController.swift
//  CBOnlineIos
//
//  Created by Pushpinder Pal Singh on 19/06/20.
//  Copyright © 2020 Coding Blocks. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var navBarView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarView.layer.cornerRadius = 20
        navBarView.clipsToBounds = true
        navBarView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
    }
    
    
}
