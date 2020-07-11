//
//  Login.swift
//  CBOnlineIos
//
//  Created by Vaibhav Bisht on 09/07/20.
//  Copyright © 2020 Coding Blocks. All rights reserved.
//

import UIKit
import FlagPhoneNumber
// For Disabling the Keyboard when tapped outside UITextField
extension UIViewController{
    func hideKeyborad() {
        let tap :UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


class Login: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var countryCode: FPNTextField!
    
    var listController: FPNCountryListViewController = FPNCountryListViewController(style: .grouped)
    let picker1 = UIPickerView()
    var activeTextField = 0
    var textfield2 : [String] = []
    var pickerView2 : [String] = []
    var textField3: [String] = []
    var phoneNumberEntered = ""
    var countryCodeEntered = ""
    var numberCheck = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: View init
    func setupView(){
//        dataFetcher()
        self.hideKeyborad()
        updatePrivacyPolicy()
//        createPickerView()
//        createToolbar()
        
        textView.backgroundColor = .clear
        textView.textColor = .darkGray
        textView.textAlignment = .center
        countryCode.backgroundColor = .clear
        countryCode.textColor = .darkGray
        countryCode.textAlignment = .right
        pickerview()
        
    }
    // MARK: HyperLink
    // This is  function is for making Huperlink of Privacy Policy and Terms of Service.
    func updatePrivacyPolicy() {
        let string = "By logging in, you agree to Coding Block's Privacy Policy & Terms of Service.  "
        let linkString = NSMutableAttributedString(string: string)
        linkString.addAttribute(NSAttributedString.Key.link, value: NSURL(string: "https://codingblocks.com/privacypolicy.html#:~:text=If%20Coding%20Blocks%20Pvt.,to%20a%20different%20privacy%20policy.")!, range: NSMakeRange(43,14))
        linkString.addAttribute(NSAttributedString.Key.link, value: NSURL(string: "https://codingblocks.com/tos.html")!, range: NSMakeRange(60, 16))
        linkString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "HelveticaNeue", size: 14.0)!, range: NSMakeRange(0, string.count))
        textView.attributedText = linkString
        textView.delegate = self
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
    }
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return false
    }
    
    private func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        return true
    }
 
    //MARK: Picker View
    func pickerview(){
        countryCode.borderStyle = .none
        countryCode.textAlignment = .center
        //        phoneNumberTextField.pickerView.showPhoneNumbers = false
                countryCode.displayMode = .list // .picker by default

                listController.setup(repository: countryCode.countryRepository)

                listController.didSelect = { [weak self] country in
                    self?.countryCode.setFlag(countryCode: country.code)
                }

                countryCode.delegate = self
                countryCode.font = UIFont.systemFont(ofSize: 14)

                // Custom the size/edgeInsets of the flag button
                countryCode.flagButtonSize = CGSize(width: 35, height: 35)
               countryCode.flagButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

                // Example of customizing the textField input accessory view
                let items = [
                    UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: nil),
                    UIBarButtonItem(title: "Item 1", style: .plain, target: self, action: nil),
                    UIBarButtonItem(title: "Item 2", style: .plain, target: self, action: nil)
                ]
               countryCode.textFieldInputAccessoryView = getCustomTextFieldInputAccessoryView(with: items)

                // The placeholder is an example phone number of the selected country by default. You can add your own placeholder :
               countryCode.hasPhoneNumberExample = false
               countryCode.placeholder = "Phone Number"

                // Set the country list
                //        phoneNumberTextField.setCountries(including: [.ES, .IT, .BE, .LU, .DE])

                // Exclude countries from the list
                //        phoneNumberTextField.setCountries(excluding: [.AM, .BW, .BA])

                // Set the flag image with a region code
              countryCode.setFlag(countryCode: .IN)

                // Set the phone number directly
        //        phoneNumberTextField.set(phoneNumber: "+33612345678")


                countryCode.center = view.center
    }
    private func getCustomTextFieldInputAccessoryView(with items: [UIBarButtonItem]) -> UIToolbar {
        let toolbar: UIToolbar = UIToolbar()

        toolbar.barStyle = UIBarStyle.default
        toolbar.items = items
        toolbar.sizeToFit()

        return toolbar
    }

    @objc func dismissCountries() {
        listController.dismiss(animated: true, completion: nil)
    }
    //MARK: Proceed Button operations
    // In this block of code we will work over prcoceed buttion operations
    @IBAction func Button(_ sender: UIButton) {
        if numberCheck == 0 {
            alertControllerIsEmplty()
        }
        else{
            performSegue(withIdentifier: "logToVfy", sender: self)
        }
    }
    // Alert controller function
    func alertControllerIsEmplty(){
        let alertController = UIAlertController(title: "Warning", message: "Please enter correct Phone Number", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",style: .cancel, handler:nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
        
    }
    //MARK: Data Passs for next ViewController
    // In this we are passing phone number and country Code from one ViewControler to another
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "logToVfy") {
            let vc = segue.destination as! otpVerify
            vc.vfyPhonenumber = self.phoneNumberEntered
        }
    }
}

//MARK: View Controller Extension
extension Login: FPNTextFieldDelegate {
    //Lets you know when the phone number is valid or not.
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        textField.rightViewMode = .always
        if isValid{
            print(
                isValid,
                textField.getFormattedPhoneNumber(format: .E164) ?? "E164: nil",
                textField.getFormattedPhoneNumber(format: .International) ?? "International: nil",
                textField.getFormattedPhoneNumber(format: .National) ?? "National: nil",
                textField.getFormattedPhoneNumber(format: .RFC3966) ?? "RFC3966: nil",
                textField.getRawPhoneNumber() ?? "Raw: nil"
            )
            numberCheck = 1
            phoneNumberEntered = textField.getFormattedPhoneNumber(format: .International) ?? "International: nil"
        }
        else {
            numberCheck = 0
        }
    }
    //lets you know when coutry is selected
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code)
    }

    // push all the couties data in the list
    func fpnDisplayCountryList() {
        let navigationViewController = UINavigationController(rootViewController: listController)

        listController.title = "Countries"
        listController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissCountries))

        self.present(navigationViewController, animated: true, completion: nil)
    }
}





