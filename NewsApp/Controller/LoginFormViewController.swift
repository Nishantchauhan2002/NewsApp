//
//  LoginFormViewController.swift
//  NewsApp
//
//  Created by Ankit Yadav on 13/03/24.
//

import UIKit

class LoginFormViewController: UIViewController {

    @IBOutlet weak var emailEntryTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true

    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        let emailEntry = emailEntryTextField.text
        let passwordEntry = passwordTextField.text
        
        let isUser = DatabaseManager.getInstance().loginUser(email: emailEntry!, password: passwordEntry!)
        
        if isUser{
            let controller = HomScreenViewController()
            controller.viewModel.getData(param: "everything")
            navigationController?.pushViewController(controller, animated: true)
        }else{
            showAlert()
        }
    }
    func showAlert(){
        let alertController = UIAlertController(title: "Alert", message: "Please enter correct details", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        
        present(alertController, animated: true)
        
    }
    

}
