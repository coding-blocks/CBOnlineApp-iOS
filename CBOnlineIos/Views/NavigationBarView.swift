//
//  NavigationBarView.swift
//  CBOnlineIos
//
//  Created by Pushpinder Pal Singh on 02/08/20.
//  Copyright © 2020 Coding Blocks. All rights reserved.
//

import UIKit

class NavigationBarView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 0.2
        self.layer.maskedCorners  = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
    }
}
