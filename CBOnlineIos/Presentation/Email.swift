

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
        emailTextField.textFieldInit()
        passwordTextField.textFieldInit()
        passwordTextField.isSecureTextEntry = true
    }
    @IBAction func proceedButton(_ sender: UIButton) {
        userEmail = emailTextField.text ?? ""
        userPassword = passwordTextField.text ?? ""
        if userEmail.isEmpty{
            errorCalling(errorMessage: "Please enter email address")
        }
        else{
            if userPassword.isEmpty{
                errorCalling(errorMessage: "Please enter password")
            }
            else{
                if isValidEmail(emailID: userEmail) == false{
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
extension UITextField{
    func setTextField(){
    }
}

