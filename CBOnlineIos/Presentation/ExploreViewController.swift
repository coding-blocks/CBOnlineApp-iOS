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
    @IBOutlet weak var headerButton: UIView!
    
    let gradient = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setHeaderButton()
    }
    func setNavBar(){
        navBarView.layer.cornerRadius = 20
        navBarView.clipsToBounds = true
        navBarView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
    }
    func setHeaderButton(){
        headerButton.layer.cornerRadius = 10
        gradient.frame = headerButton.bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        headerButton.layer.addSublayer(gradient)
    }
}
