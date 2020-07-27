

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields

class Email: UIViewController, UITextFieldDelegate {
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
//        passwordTextField.trailingView = UIView(frame: CGRect(x: 0, y: 0, width: 27, height: 22))
//        passwordTextField.trailingView?.backgroundColor = UIColor(patternImage: UIImage(systemName: "eye.fill"))
          
        if #available(iOS 13.0, *) {
            passwordTextField.trailingView = UIImageView(image: UIImage(systemName: "eye.fill"))
            passwordTextField.leadingViewMode = .always
        } else {
            // Fallback on earlier versions
        }
        iconClick = true
    }
    // For secure Text
    @IBAction func showSecureButton(_ sender: UIButton) {
        if(iconClick == true){
            passwordTextField.isSecureTextEntry = false
            if #available(iOS 13.0, *) {
//                toggleSecureButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
                passwordTextField.trailingView = UIImageView(image: UIImage(systemName: "eye.slash.fill"))
                           passwordTextField.leadingViewMode = .always
            } else {
                // Fallback on earlier versions
                return
            }
            iconClick = false
        }
        else{
            passwordTextField.isSecureTextEntry = true
            if #available(iOS 13.0, *) {
//                toggleSecureButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
                passwordTextField.trailingView = UIImageView(image: UIImage(systemName: "eye.fill"))
                           passwordTextField.leadingViewMode = .always
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
//            emailFieldIsEmplty()
            errorCalling(errorMessage: "Please enter email address")
        }
        else{
            if userPassword.isEmpty{
//                passwrdFiledIsEmplty()
                errorCalling(errorMessage: "Please enter password")
            }
            else{
                if isValidEmail(emailID: userEmail) == false{
//                    invalidEmail()
                    errorCalling(errorMessage: "Please enter valid email address")
                }
                else{
                    // will use userEmail and userPasword for internaction
                }
            }
            
        }
    }
    
    // Alert controller function
    func errorCalling (errorMessage :String) {
        let alertController = UIAlertController(title: "Warning", message: errorMessage , preferredStyle: .alert)
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

