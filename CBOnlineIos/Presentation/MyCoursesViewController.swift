//
//  MyCoursesViewController.swift
//  CBOnlineIos
//
//  Created by Pushpinder Pal Singh on 02/08/20.
//  Copyright © 2020 Coding Blocks. All rights reserved.
//

import UIKit

class MyCoursesViewController: UIViewController {

    
    @IBOutlet weak var NavigationBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavigationBar.layer.cornerRadius = 20
        NavigationBar.layer.borderWidth = 0.2
        
        NavigationBar.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
    }


}
