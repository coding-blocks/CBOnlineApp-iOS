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
        gradient.cornerRadius = 10
        gradient.frame = headerButton.bounds
        gradient.colors = [UIColor.rgb(red: 4, green: 103, blue: 246).cgColor, UIColor.rgb(red: 4, green: 16, blue: 176).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        headerButton.layer.addSublayer(gradient)
    }
    @IBAction func headerButtonPressed(_ sender: UIButton) {
        print("Whats up dog?")
    }
}
