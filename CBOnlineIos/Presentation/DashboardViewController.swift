//
//  DashboardViewController.swift
//  CBOnlineIos
//
//  Created by Pushpinder Pal Singh on 19/06/20.
//  Copyright © 2020 Coding Blocks. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var navBarView: UIView!
    @IBOutlet var performaceViews: [UIView]!
    @IBOutlet weak var CourseProgress: CustomHorizontalProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarView.layer.cornerRadius = 20
        for views in performaceViews{
            views.layer.applySketchShadow(color: .gray, alpha: 0.3, x: 0, y: 0, blur: 0, spread: 1)
        }
        CourseProgress.progress = 50
    }
    
}

