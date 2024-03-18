//
//  SignUpFormViewController.swift
//  NewsApp
//
//  Created by Nishant Chauhan on 13/03/24.
//

import UIKit

class SignUpFormViewController: UIViewController {

    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var nationalityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        passwordTextField.isSecureTextEntry = true
        confirmTextField.isSecureTextEntry = true

    }
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        if passwordTextField.text == confirmTextField.text{
            let modelInfo = SignUpModel(fname: nameTextfield.text!, email: emailTextField.text!, password: passwordTextField.text!, nation: nationalityTextField.text!)
            let isSave = DatabaseManager.getInstance().saveData(modelInfo)

            if isSave{
                showRegisteredUserAlert(saved: true,title: "Success", message: "You have successfully registered");
            }else{
                showRegisteredUserAlert(saved: false,title: "Alert", message: "Already an user with this mail")
            }
            
        }else{
            showRegisteredUserAlert(saved: false, title: "Mismatch", message: "Password mismatched")
        }
    }
    func showRegisteredUserAlert(saved:Bool,title:String,message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if (saved){
                self.navigationController?.popViewController(animated: true)

            }
        }
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)

    }
}
