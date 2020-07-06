//
//  otpVerify.swift
//  CBOnlineIos
//
//  Created by Vaibhav Bisht on 06/07/20.
//  Copyright © 2020 Coding Blocks. All rights reserved.
//

import UIKit

extension UIViewController{
    func hideKeyboradOtp() {
        let tap :UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardOtp))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboardOtp() {
        view.endEditing(true)
    }
}

class otpVerify: UIViewController {

    @IBOutlet weak var otpField: UITextField!
    @IBOutlet weak var phoneNumberDisplay: UILabel!
    
    var vfyPhonenumber: String = ""
    var vfyCountryCode: String = ""
    var fullPhoneNumber = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetttings()
    }
    func initialSetttings() {
        self.hideKeyboradOtp()
        otpField.backgroundColor = .clear
          otpField.attributedPlaceholder = NSAttributedString(string: "Enter One Time Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        otpField.textAlignment = .center
        fullPhoneNumber = vfyCountryCode + "-" + vfyPhonenumber
        phoneNumberDisplay.text = "We will auto verify the OTP sent to " + fullPhoneNumber
        otpField.textColor = UIColor.darkGray
    }
}

