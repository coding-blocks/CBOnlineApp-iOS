//
//  otpVerify.swift
//  CBOnlineIos
//
//  Created by Vaibhav Bisht on 09/07/20.
//  Copyright © 2020 Coding Blocks. All rights reserved.
//

import UIKit

class OTPVerify: UIViewController {

    @IBOutlet weak var otpField: UITextField!
    @IBOutlet weak var phoneNumberDisplay: UILabel!
    
    var vfyPhonenumber: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetttings()
    }
    func initialSetttings() {
        self.setupHideKeyboardOnTap()
        otpField.backgroundColor = .clear
          otpField.attributedPlaceholder = NSAttributedString(string: "Enter One Time Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        otpField.textAlignment = .center
        phoneNumberDisplay.text = "We will auto verify the OTP sent to " + vfyPhonenumber
        otpField.textColor = UIColor.darkGray
    }
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "vfyToLog", sender: self)
    }
    
}



