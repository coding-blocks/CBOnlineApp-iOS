//
//  Login.swift
//  CBOnlineIos
//
//  Created by Vaibhav Bisht on 06/07/20.
//  Copyright © 2020 Coding Blocks. All rights reserved.
//

import UIKit

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


class Login: UIViewController, UITextFieldDelegate, UIPickerViewDelegate,  UIPickerViewDataSource, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var countryCode: UITextField!
    
    let picker1 = UIPickerView()
    var activeTextField = 0
    var textfield2 : [String] = []
    var pickerView2 : [String] = []
    var textField3: [String] = []
    var phoneNumberEntered = ""
    var countryCodeEntered = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataFetcher()
        self.hideKeyborad()
        updatePrivacyPolicy()
        createPickerView()
        createToolbar()
        
        phoneNumber.delegate = self
        countryCode.delegate = self
        textView.backgroundColor = .clear
        textView.textColor = .darkGray
        textView.textAlignment = .center
        countryCode.backgroundColor = .clear
        countryCode.textColor = .darkGray
        phoneNumber.attributedPlaceholder = NSAttributedString(string: "Enter your Mobile Number", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        phoneNumber.textColor = UIColor.darkGray
        phoneNumber.textAlignment = .left
        countryCode.textAlignment = .right
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
    //MARK: DATA FETCHER
    // In this data is fetched from the JSON File for the country name and Country Code
    func dataFetcher() {
        guard let path = Bundle.main.path(forResource: "countryData", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        do{
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            guard let array = json as?[Any] else {
                return
            }
            for user in array {
                guard let userDict = user as? [String: Any] else{
                    return
                }
                guard let countryNickName = userDict["ISOCode"] as? String else {
                    return
                }
                guard let countryName = userDict["CountryEnglishName"] as? String else {
                    return
                }
                guard let numberExtension = userDict["CountryCode"] as? Int else {
                    return
                }
                //for converting number code from Int to String so to add (+) logo
                let numberExtensionConversion = String(numberExtension)
                let plusLogo = "\u{002B}"
                let finalNumberExtension = plusLogo + numberExtensionConversion
                
                let textView1 = countryNickName + "("+finalNumberExtension + ")"
                let pickerView1 = countryName + " "+finalNumberExtension
                
                pickerView2.append(pickerView1)
                textfield2.append(textView1)
                textField3.append(numberExtensionConversion)
            }
        }
        catch{
            print(error)
        }
    }
    
    // MARK: Picker View
    // This will maitain the perations od the pickerview and displaying all its label
    func createPickerView()
    {
        picker1.delegate = self
        picker1.delegate?.pickerView?(picker1, didSelectRow: 0, inComponent: 0)
        countryCode.inputView = picker1
        countryCode.textColor = .darkGray
        
        if #available(iOS 13.0, *) {
            picker1.backgroundColor = UIColor.systemGray4
        } else {
            // Fallback on earlier versions
            picker1.backgroundColor = UIColor.lightGray
        }
    }
    
    
    func createToolbar()
    {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.tintColor = UIColor.systemBlue
        if #available(iOS 13.0, *) {
            toolbar.backgroundColor = UIColor.systemGray4
        } else {
            // Fallback on earlier versions
            toolbar.backgroundColor = UIColor.lightGray
        }
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(closePickerView))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        countryCode.inputAccessoryView = toolbar
    }
    
    @objc func closePickerView()
    {
        view.endEditing(true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //It counts total number of component inside the array
        return pickerView2.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return pickerView2[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // It sets the textField on the View Controller (County Code + Country short Name )
        countryCode.text = textfield2[row]
        self.countryCodeEntered = textField3[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return (300)
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        
        switch activeTextField{
        case 1:
            var label:UILabel
            
            if let v = view as? UILabel{
                label = v
            }
            else{
                label = UILabel()
            }
            
            if self.traitCollection.userInterfaceStyle == .dark {
                // User Interface is Dark
                label.textColor = UIColor.white
            } else {
                // User Interface is Light
                label.textColor = UIColor.black
            }
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica", size: 16)
            // It sets the text label inside the picker view (Country full name + country Code)
            label.text = pickerView2[row]
//            self.countryCodeEntered = textField3[row]
            return label
            
        default:
            return UILabel()
            
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        switch textField {
        case countryCode:
            activeTextField = 1
            picker1.reloadAllComponents()
        default:
            activeTextField = 0
        }
        
    }
    
    //MARK: Proceed Button operations
    // In this block of code we will work over prcoceed buttion operations
    @IBAction func Button(_ sender: UIButton) {
        if phoneNumber.text?.isEmpty ?? true {
            print("call the alert controller")
            alertControllerIsEmplty()
        }
        else{
            print("FaceBook")
            self.phoneNumberEntered =  phoneNumber.text!
            performSegue(withIdentifier: "logToVfy", sender: self)
        }
    }
    func alertControllerIsEmplty(){
        let alertController = UIAlertController(title: "Warning", message: "Please enter phone number before proceeding", preferredStyle: .alert)
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
            vc.vfyCountryCode = self.countryCodeEntered
        }
    }
}

