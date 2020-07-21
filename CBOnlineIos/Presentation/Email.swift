

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields

class Email: UIViewController {
    @IBOutlet weak var emailTextField: MDCFilledTextField!
    @IBOutlet weak var passwordTextField: MDCFilledTextField!
    @IBOutlet weak var toggleSecureButton: UIButton!
    var userEmail: String = ""
    var userPassword: String = ""
    
    var iconClick : Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView(){
        self.setupHideKeyboardOnTap()
        emailTextField.label.text = "Use Email"
        passwordTextField.label.text = "Password"
        emailTextField.setFilledBackgroundColor(UIColor.clear, for: .editing)
        emailTextField.setFilledBackgroundColor(UIColor.clear, for: .normal)
        passwordTextField.setFilledBackgroundColor(UIColor.clear, for: .editing)
        passwordTextField.setFilledBackgroundColor(UIColor.clear, for: .normal)
        emailTextField.setFloatingLabelColor(UIColor.orange, for: .editing)
        emailTextField.setNormalLabelColor(UIColor.black, for: .normal)
        passwordTextField.setFloatingLabelColor(UIColor.orange, for: .editing)
        passwordTextField.setNormalLabelColor(UIColor.black, for: .normal)
        emailTextField.setUnderlineColor(UIColor.orange, for: .editing)
        emailTextField.setUnderlineColor(UIColor.black, for: .normal)
        passwordTextField.setUnderlineColor(UIColor.orange, for: .editing)
        passwordTextField.setUnderlineColor(UIColor.black, for: .normal)
        emailTextField.setTextColor(UIColor.black, for: .editing)
        emailTextField.setTextColor(UIColor.black, for: .normal)
        passwordTextField.setTextColor(UIColor.black, for: .editing)
        passwordTextField.setTextColor(UIColor.black, for: .normal)
        emailTextField.tintColor = UIColor.orange
        passwordTextField.tintColor = UIColor.orange
        iconClick = true
        
        if #available(iOS 13.0, *) {
            toggleSecureButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            // Fallback on earlier versions
            return
        }
        
        
    }
    // For secure Text
    @IBAction func showSecureButton(_ sender: UIButton) {
        if(iconClick == true){
            passwordTextField.isSecureTextEntry = false
            if #available(iOS 13.0, *) {
                toggleSecureButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            } else {
                // Fallback on earlier versions
                return
            }
            iconClick = false
        }
        else{
            passwordTextField.isSecureTextEntry = true
            if #available(iOS 13.0, *) {
                toggleSecureButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            } else {
                // Fallback on earlier versions
                return
            }
            iconClick = true
        }
    }
    @IBAction func proceedButton(_ sender: UIButton) {
        userEmail = emailTextField.text ?? ""
        userPassword = passwordTextField.text ?? ""
        if userEmail.isEmpty{
            emailFieldIsEmplty()
        }
        else{
            if userPassword.isEmpty{
                passwrdFiledIsEmplty()
            }
            else{
                if isValidEmail(emailID: userEmail) == false{
                    invalidEmail()
                }
                else{
                    // As of now printing but in future userEmail and userPassword will be used for interaction
                    print(userEmail + " " + userPassword )
                }
            }
            
        }
    }
    
    // Alert controller function
    func emailFieldIsEmplty(){
        let alertController = UIAlertController(title: "Warning", message: "Please enter email address", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",style: .cancel, handler:nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
    
    // Alert controller function
    func passwrdFiledIsEmplty(){
        let alertController = UIAlertController(title: "Warning", message: "Please enter password", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",style: .cancel, handler:nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
    
    func invalidEmail(){
        let alertController = UIAlertController(title: "Warning", message: "Please enter valid email address", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",style: .cancel, handler:nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
    
    func isValidEmail(emailID:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }
}

