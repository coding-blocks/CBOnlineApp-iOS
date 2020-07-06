//
//  ButtonCurve.swift
//  CBOnlineIos
//
//  Created by Vaibhav Bisht on 06/07/20.
//  Copyright © 2020 Coding Blocks. All rights reserved.
//

import UIKit
@IBDesignable
class ButtonCurve : UIButton {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
