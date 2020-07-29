//
//  MDCFilledTextField.swift
//  CBOnlineIos
//
//  Created by Vaibhav Bisht on 28/07/20.
//  Copyright © 2020 Coding Blocks. All rights reserved.
//

import Foundation
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields

extension MDCFilledTextField {
    func textFieldInit(){
        self.setFilledBackgroundColor(UIColor.clear, for: .editing)
        self.setFilledBackgroundColor(UIColor.clear, for: .normal)
        self.setFloatingLabelColor(UIColor.orange, for: .editing)
        self.setNormalLabelColor(UIColor.black, for: .normal)
        self.setUnderlineColor(UIColor.orange, for: .editing)
        self.setUnderlineColor(UIColor.black, for: .normal)
        self.setTextColor(UIColor.black, for: .editing)
        self.setTextColor(UIColor.black, for: .normal)
        self.tintColor = UIColor.orange
    }
}
